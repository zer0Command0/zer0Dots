#!/usr/bin/env sh

sketchybar --add item cpu.percent right \
	--set cpu.percent script="$PLUGIN_DIR/cpu.sh" \
	update_freq=2 \
	icon.drawing=off \
	label.font="$FONT:Semibold:11.0" \
	width=44 \
	background.color=$ITEM_BG_COLOR \
	background.padding_left=0 \
	background.padding_right=0

sketchybar --add item cpu_logo right \
	--set cpu_logo icon= \
	icon.font="$FONT:Semibold:13.0" \
	icon.padding_left=4 \
	icon.padding_right=2 \
	icon.color=$ACCENT_MID \
	label.drawing=off \
	background.drawing=off
