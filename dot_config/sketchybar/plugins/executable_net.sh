#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

WIFI_DEVICE=$(networksetup -listallhardwareports 2>/dev/null | awk '/Hardware Port: Wi-Fi/{getline; print $2; exit}')

SSID=""

if [ -n "$WIFI_DEVICE" ]; then
	SSID=$(ipconfig getsummary "$WIFI_DEVICE" 2>/dev/null | awk -F ' SSID : ' '/ SSID : / {print $2; exit}')
fi

if [ -z "$SSID" ] && [ -n "$WIFI_DEVICE" ]; then
	SSID=$(networksetup -getairportnetwork "$WIFI_DEVICE" 2>/dev/null | sed 's/^Current Wi-Fi Network: //')
	[ "$SSID" = "You are not associated with an AirPort network." ] && SSID=""
fi

if [ -z "$SSID" ]; then
	sketchybar --set "$NAME" label="offline" label.color="$MUTED"
else
	if [ "$SSID" = "<redacted>" ]; then
		sketchybar --set "$NAME" label="connected" label.color="$TEXT"
	else
		SHORT_SSID=$(printf '%s' "$SSID" | cut -c1-18)
		sketchybar --set "$NAME" label="$SHORT_SSID" label.color="$TEXT"
	fi
fi
