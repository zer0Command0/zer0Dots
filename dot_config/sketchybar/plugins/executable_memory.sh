#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

FREE_PERCENT=$(memory_pressure 2>/dev/null | awk '/System-wide memory free percentage/ {gsub("%", "", $5); print int($5); exit}')

if [ -z "$FREE_PERCENT" ]; then
	FREE_PAGES=$(vm_stat | awk '/Pages free/ {gsub("\\.", "", $3); print $3}')
	SPEC_PAGES=$(vm_stat | awk '/Pages speculative/ {gsub("\\.", "", $3); print $3}')
	ACTIVE_PAGES=$(vm_stat | awk '/Pages active/ {gsub("\\.", "", $3); print $3}')
	WIRED_PAGES=$(vm_stat | awk '/Pages wired down/ {gsub("\\.", "", $4); print $4}')
	COMPRESSED_PAGES=$(vm_stat | awk '/Pages occupied by compressor/ {gsub("\\.", "", $5); print $5}')

	TOTAL_PAGES=$((FREE_PAGES + SPEC_PAGES + ACTIVE_PAGES + WIRED_PAGES + COMPRESSED_PAGES))
	if [ "$TOTAL_PAGES" -gt 0 ]; then
		FREE_PERCENT=$(((FREE_PAGES + SPEC_PAGES) * 100 / TOTAL_PAGES))
	else
		FREE_PERCENT=0
	fi
fi

USED_PERCENT=$((100 - FREE_PERCENT))
[ "$USED_PERCENT" -lt 0 ] && USED_PERCENT=0
[ "$USED_PERCENT" -gt 100 ] && USED_PERCENT=100

COLOR="$SUBTEXT"
case "$USED_PERCENT" in
[5-6][0-9]) COLOR="$ACCENT_MID" ;;
[7-8][0-9]) COLOR="$ACCENT_STRONG" ;;
[9][0-9] | 100) COLOR="$RED" ;;
esac

sketchybar --set memory.percent label="${USED_PERCENT}%" label.color="$COLOR"
