#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME \
    background.drawing=on \
    background.color=$FG \
    background.corner_radius=0 \
    background.height=11
else
  sketchybar --set $NAME \
    background.drawing=off
fi
