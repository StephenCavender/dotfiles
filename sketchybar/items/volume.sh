#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

sketchybar --add item volume right \
  --set volume \
  label.drawing=off \
  padding_left=6 \
  padding_right=6 \
  script="$CONFIG_DIR/plugins/volume.sh" \
  --subscribe volume volume_change
