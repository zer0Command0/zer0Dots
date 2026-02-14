###
# @FilePath: /sketchybar/items/time.sh
# @author: Wibus
# @Date: 2022-08-01 20:40:16
# @LastEditors: Wibus
# @LastEditTime: 2022-08-01 20:40:16
# Coding With IU
###
sketchybar --add item time right \
	--set time update_freq=1 \
	icon.drawing=off \
	label.font="$FONT:Semibold:11.0" \
	script="~/.config/sketchybar/plugins/time.sh" \
	background.color=$ITEM_BG_COLOR \
	background.padding_left=0

sketchybar --add item time_logo right --set time_logo icon= \
	icon.font="$FONT:Semibold:13.0" \
	icon.padding_left=4 \
	icon.padding_right=2 \
	label.drawing=off \
	icon.color=$ACCENT_MID \
	label.drawing=off \
	background.drawing=off
