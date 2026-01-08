#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

sketchybar --add item time right \
  --set time \
  update_freq=10 \
  icon= \
  icon.color=$CYAN \
  label.color=$FG \
  script="$CONFIG_DIR/plugins/time.sh"
