###
# @FilePath: /sketchybar/items/spotify.sh
# @author: Wibus
# @Date: 2022-08-01 20:39:56
# @LastEditors: Wibus
# @LastEditTime: 2022-08-01 20:39:57
# Coding With IU
###
sketchybar --add item spot_logo center \
	--set spot_logo icon= \
	icon.font="$FONT:Semibold:13.0" \
	icon.padding_left=4 \
	icon.padding_right=2 \
	label.drawing=off \
	icon.color=$ACCENT_STRONG \
	background.drawing=off

sketchybar --add item spot center \
	--set spot update_freq=1 \
	icon.drawing=off \
	label.font="$FONT:Semibold:11.0" \
	updates=on \
	script="~/.config/sketchybar/plugins/spotifyIndicator.sh" \
	background.color=$ITEM_BG_COLOR \
	background.padding_left=0 \
	background.padding_right=6
