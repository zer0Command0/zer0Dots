#!/usr/bin/env sh

sketchybar --add item caffeine right \
	--set caffeine icon= \
	icon.font="$FONT:Semibold:13.0" \
	script="$PLUGIN_DIR/caffeine.sh" \
	click_script="open -a Caffeine" \
	update_freq=3 \
	label.font="$FONT:Semibold:10.0" \
	background.color=$ITEM_BG_COLOR \
	background.padding_left=0 \
	background.padding_right=0
