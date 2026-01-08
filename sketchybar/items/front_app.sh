#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

sketchybar --add item front_app left \
  --set front_app \
  background.color=$TRANSPARENT \
  icon.color=$PURPLE \
  icon.font="sketchybar-app-font:Regular:15.0" \
  label.color=$FG \
  label.font="$FONT:Bold:12.0" \
  script="$PLUGIN_DIR/front_app.sh" \
  click_script="open -a 'Mission Control'" \
  --subscribe front_app front_app_switched
