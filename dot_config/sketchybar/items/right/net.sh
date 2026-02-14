###
# @FilePath: /sketchybar/items/right/net.sh
# @author: Wibus
# @Date: 2022-08-01 20:40:39
# @LastEditors: Wibus
# @LastEditTime: 2022-08-02 18:00:24
# Coding With IU
###
sketchybar --add item net right \
	--set net script="$PLUGIN_DIR/net.sh" \
	click_script="open 'x-apple.systempreferences:com.apple.Network-Settings.extension'" \
	label.font="$FONT:Semibold:11.0" \
	icon.drawing=off \
	background.color=$ITEM_BG_COLOR \
	background.padding_left=0 \
	update_freq=5

sketchybar --add item net_logo right \
	--set net_logo icon= \
	icon.font="$FONT:Semibold:13.0" \
	icon.padding_left=4 \
	icon.padding_right=2 \
	icon.color=$ACCENT_MID \
	label.drawing=off \
	background.drawing=off
