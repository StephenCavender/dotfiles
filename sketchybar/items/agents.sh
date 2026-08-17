#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

sketchybar --add item agents right \
  --set agents \
  update_freq=5 \
  drawing=off \
  icon="󰚩" \
  icon.font="$FONT:Bold:18.0" \
  icon.color=$YELLOW \
  label.color=$YELLOW \
  script="$CONFIG_DIR/plugins/agents.sh" \
  click_script="$CONFIG_DIR/plugins/agents.sh jump"
