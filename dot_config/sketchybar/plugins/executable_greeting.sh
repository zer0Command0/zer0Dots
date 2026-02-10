#!/bin/sh

HOUR=$(date +%H)
DAY=$(date +%u)

if [ "$HOUR" -ge 6 ] && [ "$HOUR" -lt 12 ]; then
  GREET="buongiorno"
  ICON="☀️"
elif [ "$HOUR" -ge 12 ] && [ "$HOUR" -lt 18 ]; then
  GREET="buon pomeriggio"
  ICON="🌤"
elif [ "$HOUR" -ge 18 ] && [ "$HOUR" -lt 22 ]; then
  GREET="buonasera"
  ICON="🌙"
else
  GREET="notte fonda"
  ICON="🦉"
fi

# Fun friday
if [ "$DAY" = "5" ] && [ "$HOUR" -ge 17 ]; then
  GREET="weekend!"
  ICON="🍻"
fi

UPTIME=$(uptime | sed 's/.*up //' | sed 's/,.*//' | xargs)

sketchybar --set "$NAME" icon="$ICON" label="$GREET  ↑$UPTIME"
