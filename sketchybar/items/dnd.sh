#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

sketchybar --add item dnd right \
  --set dnd \
  icon=󰂚 \
  icon.color=$PURPLE \
  icon.font="$FONT:Bold:18.0" \
  label.drawing=off \
  script="$CONFIG_DIR/plugins/dnd.sh" \
  click_script="$CONFIG_DIR/plugins/dnd.sh toggle" \
  --subscribe dnd
