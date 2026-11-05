#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

sketchybar --add item battery right \
  --set battery \
  update_freq=120 \
  padding_left=6 \
  padding_right=6 \
  icon.drawing=on \
  label.drawing=off \
  script="$PLUGIN_DIR/battery.sh" \
  --subscribe battery system_woke power_source_change
