#!/usr/bin/env sh

POPUP_CLICK_SCRIPT="sketchybar --set $NAME popup.drawing=toggle"

sketchybar --add item apple.logo left \
	--set apple.logo icon= \
	icon.font="$FONT:Semibold:13.0" \
	icon.color=$ACCENT_STRONG \
	icon.padding_left=12 \
	icon.padding_right=10 \
	background.drawing=off \
	background.padding_right=8 \
	background.padding_left=4 \
	background.corner_radius=8 \
	label.drawing=off \
	click_script="$POPUP_CLICK_SCRIPT" \
	--add item apple.preferences popup.apple.logo \
	--set apple.preferences icon= \
	label="Preferences" \
	click_script="open -a 'System Settings'; sketchybar -m --set apple.logo popup.drawing=off" \
	--add item apple.activity popup.apple.logo \
	--set apple.activity icon= \
	label="Activity" \
	click_script="open -a 'Activity Monitor'; sketchybar -m --set apple.logo popup.drawing=off" \
	--add item apple.lock popup.apple.logo \
	--set apple.lock icon= \
	label="Lock Screen" \
	click_script="pmset displaysleepnow; sketchybar -m --set apple.logo popup.drawing=off" \
	--add item apple.update popup.apple.logo \
	--set apple.update icon= \
	label="Update SketchyBar" \
	click_script="sketchybar --update"
