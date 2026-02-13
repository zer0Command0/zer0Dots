#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

CORE_COUNT=$(sysctl -n hw.ncpu)
CPU_PERCENT=$(ps -A -o %cpu | awk -v cores="$CORE_COUNT" 'NR>1 {sum += $1} END {printf "%.0f", sum / cores}')
[ -z "$CPU_PERCENT" ] && CPU_PERCENT=0

COLOR=$SUBTEXT
case "$CPU_PERCENT" in
[3-5][0-9]) COLOR=$ACCENT_MID ;;
[6-7][0-9]) COLOR=$ACCENT_STRONG ;;
[8-9][0-9] | 100) COLOR=$RED ;;
esac

sketchybar --set cpu.percent label="$CPU_PERCENT%" label.color="$COLOR"
