#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

sketchybar --add item brightness right \
  --set brightness \
  icon.color=$ORANGE \
  label.color=$FG \
  script="$CONFIG_DIR/plugins/brightness.sh" \
  --subscribe brightness brightness_change
