#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

sketchybar --add item volume right \
  --set volume \
  icon.color=$PINK \
  label.color=$FG \
  script="$CONFIG_DIR/plugins/volume.sh" \
  --subscribe volume volume_change
