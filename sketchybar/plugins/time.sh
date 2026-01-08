#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

sketchybar --set "$NAME" \
  icon= \
  icon.color=$CYAN \
  label="$(date '+%H:%M')"
