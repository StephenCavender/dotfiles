#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

sketchybar --add event brew_update \
  --add item homebrew right \
  --set homebrew \
  icon= \
  icon.color=$PINK \
  update_freq=1800 \
  label=? \
  label.color=$FG \
  script="$CONFIG_DIR/plugins/homebrew.sh" \
  --subscribe homebrew brew_update
