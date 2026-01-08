#!/usr/bin/env bash

source "$CONFIG_DIR/scripts/config.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME \
    background.color=$PURPLE \
    background.border_width=2 \
    background.border_color=$PINK \
    icon.color=$BG \
    label.color=$BG
else
  sketchybar --set $NAME \
    background.color=$CURRENT_LINE \
    background.border_width=0 \
    icon.color=$COMMENT \
    label.color=$FG
fi
