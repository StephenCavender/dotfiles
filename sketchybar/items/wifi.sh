#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

wifi=(
  label.width=0
  icon=󰖪
  label.color=$COMMENT
  script="$CONFIG_DIR/plugins/wifi.sh"
)

sketchybar --add item wifi right \
  --set wifi "${wifi[@]}" \
  --subscribe wifi wifi_change mouse.clicked
