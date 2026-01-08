#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

sketchybar --set "$NAME" \
  icon=󰸘 \
  icon.color=$PURPLE \
  label="$(date '+%a %d %b')"
