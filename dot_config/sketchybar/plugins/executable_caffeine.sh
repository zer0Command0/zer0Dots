#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

APP_OPEN=0
ACTIVE=0

if pgrep -x "Caffeine" >/dev/null 2>&1; then
	APP_OPEN=1
fi

if pmset -g assertions 2>/dev/null | grep -Eiq 'Caffeine|caffeinate'; then
	ACTIVE=1
fi

if [ "$APP_OPEN" -eq 1 ] && [ "$ACTIVE" -eq 1 ]; then
	sketchybar --set "$NAME" icon.color="$ACCENT_STRONG" label="active" label.color="$TEXT"
elif [ "$APP_OPEN" -eq 1 ]; then
	sketchybar --set "$NAME" icon.color="$ACCENT_MID" label="open" label.color="$SUBTEXT"
else
	sketchybar --set "$NAME" icon.color="$MUTED" label="off" label.color="$MUTED"
fi
