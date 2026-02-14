#!/usr/bin/env sh

sketchybar --add item tailscale right \
	--set tailscale icon=󰱓 \
	icon.font="$FONT:Semibold:13.0" \
	script="$PLUGIN_DIR/tailscale.sh" \
	click_script="open -a Tailscale" \
	update_freq=5 \
	label.font="$FONT:Semibold:10.0" \
	background.color=$ITEM_BG_COLOR \
	background.padding_left=0 \
	background.padding_right=0
