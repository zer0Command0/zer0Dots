#!/bin/bash
PROC="aerospace-cheatsheet"
if pgrep -x "$PROC" > /dev/null 2>&1; then
    pkill -x "$PROC"
else
    ~/.config/aerospace/"$PROC" &
    disown
fi
