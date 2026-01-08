#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

sketchybar --add item date right \
  --set date \
  update_freq=10 \
  icon=󰸘 \
  icon.color=$PURPLE \
  label.color=$FG \
  script="$CONFIG_DIR/plugins/date.sh"
