#!/usr/bin/env bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" \
    background.color=0x66c9a0ff \
    background.border_width=1 \
    icon.color=0xFFffffff \
    label.color=0xCCffffff
else
  sketchybar --set "$NAME" \
    background.color=0x33ffffff \
    background.border_width=0 \
    icon.color=0x99ffffff \
    label.color=0x55ffffff
fi
