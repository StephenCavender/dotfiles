#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

sketchybar --add item memory right \
  --set memory \
  update_freq=5 \
  icon= \
  icon.color=$GREEN \
  label.color=$FG \
  script="$CONFIG_DIR/plugins/memory.sh"
