WORKSPACES=(1 2 3 4 5 6 7 8 9 0)

for sid in "${WORKSPACES[@]}"; do
	sketchybar --add item workspace.$sid left \
		--set workspace.$sid icon="$sid" \
		icon.padding_left=12 \
		icon.padding_right=12 \
		icon.highlight_color=$FOCUSED_TEXT \
		icon.color=$MUTED \
		background.padding_left=4 \
		background.padding_right=4 \
		background.color=$ITEM_BG_COLOR \
		background.corner_radius=8 \
		background.drawing=on \
		label.drawing=on \
		label.color=$SUBTEXT \
		label.font="JetBrainsMono Nerd Font:Bold:13.0" \
		label.padding_left=6 \
		label.padding_right=10 \
		script="$PLUGIN_DIR/aerospace_workspaces.sh" \
		update_freq=2 \
		click_script="aerospace workspace $sid; sketchybar --trigger aerospace_refresh" \
		--subscribe workspace.$sid aerospace_refresh display_change front_app_switched
done

sketchybar --add item space_separator left \
	--set space_separator icon=• \
	icon.color=$MUTED \
	background.color=$TRANSPARENT \
	background.padding_left=0 \
	background.padding_right=0 \
	label.drawing=off \
	icon.padding_left=10 \
	icon.padding_right=10

sketchybar --add item window_title left \
	--set window_title script="~/.config/sketchybar/plugins/window_title.sh" \
	icon.drawing=off \
	label.color=$SUBTEXT \
	background.color=$ITEM_BG_COLOR \
	background.drawing=on \
	background.corner_radius=8 \
	--subscribe window_title front_app_switched
