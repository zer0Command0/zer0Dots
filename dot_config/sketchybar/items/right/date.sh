###
# @FilePath: /sketchybar/items/date.sh
# @author: Wibus
# @Date: 2022-08-01 20:40:25
# @LastEditors: Wibus
# @LastEditTime: 2022-08-01 20:40:25
# Coding With IU
###

sketchybar --add item date right \
	--set date update_freq=1000 \
	icon.drawing=off \
	label.font="$FONT:Semibold:11.0" \
	script="~/.config/sketchybar/plugins/date.sh" \
	background.color=$ITEM_BG_COLOR \
	background.padding_left=0

sketchybar --add item clock_logo right --set clock_logo icon= \
	icon.font="$FONT:Semibold:13.0" \
	icon.padding_left=4 \
	icon.padding_right=2 \
	icon.color=$ACCENT_MID label.drawing=off \
	background.drawing=off
