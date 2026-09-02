#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

sketchybar --add item clock e \
  --set clock \
  update_freq=10 \
  icon.drawing=off \
  script="$CONFIG_DIR/plugins/clock.sh"
