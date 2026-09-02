#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

sketchybar --set "$NAME" \
  label="$(date '+%A %H:%M')"
