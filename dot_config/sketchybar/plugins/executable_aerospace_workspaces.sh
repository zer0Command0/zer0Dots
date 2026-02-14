#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

sid="${NAME#workspace.}"
focused_workspace="$(aerospace list-workspaces --focused 2>/dev/null)"
visible_workspaces="$(aerospace list-workspaces --monitor all --visible 2>/dev/null | tr '\n' ' ')"
workspace_apps="$(aerospace list-windows --workspace "$sid" --format '%{app-name}' 2>/dev/null)"

icon_color="$MUTED"
label_color="$SUBTEXT"
bg_color="$ITEM_BG_COLOR"
highlight="off"
apps_label="-"

app_icon() {
	case "$1" in
	"Google Chrome") printf "" ;;
	"Safari") printf "" ;;
	"iTerm2") printf "" ;;
	"Ghostty") printf "" ;;
	"PhpStorm") printf "" ;;
	"Postman") printf "󰛮" ;;
	"Slack") printf "" ;;
	"WhatsApp") printf "" ;;
	"Telegram") printf "" ;;
	"Obsidian") printf "󰎚" ;;
	"Claude") printf "󱙺" ;;
	"Spotify") printf "" ;;
	"zoom.us") printf "" ;;
	*) printf "•" ;;
	esac
}

if [ -n "$workspace_apps" ]; then
	unique_apps="$(printf '%s\n' "$workspace_apps" | awk 'NF && !seen[$0]++')"
	apps_label=""
	app_count=0
	extra_count=0

	while IFS= read -r app_name; do
		[ -z "$app_name" ] && continue
		if [ "$app_count" -lt 3 ]; then
			apps_label="$apps_label$(app_icon "$app_name") "
			app_count=$((app_count + 1))
		else
			extra_count=$((extra_count + 1))
		fi
	done <<EOF
$unique_apps
EOF

	apps_label="${apps_label% }"
	if [ "$extra_count" -gt 0 ]; then
		apps_label="$apps_label +$extra_count"
	fi
fi

if printf '%s' " $visible_workspaces " | /usr/bin/grep -q " $sid "; then
	icon_color="$TEXT"
	label_color="$TEXT"
fi

if [ "$focused_workspace" = "$sid" ]; then
	icon_color="$TEXT"
	label_color="$TEXT"
	bg_color="$ACCENT_COLOR"
	highlight="on"
fi

sketchybar --set "$NAME" drawing=on icon.color="$icon_color" label.color="$label_color" background.color="$bg_color" icon.highlight="$highlight" label="$apps_label"
