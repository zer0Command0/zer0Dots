#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

TAILSCALE_BIN=""
if [ -x "/usr/local/bin/tailscale" ]; then
	TAILSCALE_BIN="/usr/local/bin/tailscale"
elif [ -x "/opt/homebrew/bin/tailscale" ]; then
	TAILSCALE_BIN="/opt/homebrew/bin/tailscale"
elif command -v tailscale >/dev/null 2>&1; then
	TAILSCALE_BIN="$(command -v tailscale)"
fi

if [ -z "$TAILSCALE_BIN" ]; then
	sketchybar --set "$NAME" label="not connected" icon.color="$MUTED" label.color="$MUTED"
	exit 0
fi

TS_DATA=$($TAILSCALE_BIN status --json 2>/dev/null)

if [ -z "$TS_DATA" ]; then
	sketchybar --set "$NAME" label="not connected" icon.color="$MUTED" label.color="$MUTED"
	exit 0
fi

TS_STATE=$(printf '%s' "$TS_DATA" | python3 -c 'import json,sys; d=json.load(sys.stdin); b=d.get("BackendState","NoState"); s=(d.get("Self") or {}); online=bool(s.get("Online")); print(f"{b}|{int(online)}")' 2>/dev/null)

STATE_NAME=$(printf '%s' "$TS_STATE" | cut -d'|' -f1)
ONLINE=$(printf '%s' "$TS_STATE" | cut -d'|' -f2)

if [ "$STATE_NAME" = "Running" ] && [ "$ONLINE" = "1" ]; then
	sketchybar --set "$NAME" label="connected" icon.color="$ACCENT_STRONG" label.color="$TEXT"
else
	sketchybar --set "$NAME" label="not connected" icon.color="$MUTED" label.color="$MUTED"
fi
