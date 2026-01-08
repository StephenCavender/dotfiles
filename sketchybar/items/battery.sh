#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

sketchybar --add item battery right \
  --set battery \
  update_freq=120 \
  icon.drawing=on \
  padding_right=10 \
  script="$PLUGIN_DIR/battery.sh" \
  --subscribe battery system_woke power_source_change
