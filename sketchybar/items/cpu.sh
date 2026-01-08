#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

sketchybar --add item cpu right \
  --set cpu \
  update_freq=5 \
  icon= \
  icon.color=$CYAN \
  label.color=$FG \
  script="$CONFIG_DIR/plugins/cpu.sh"
