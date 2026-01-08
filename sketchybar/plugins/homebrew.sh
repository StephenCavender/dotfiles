#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

COUNT="$(brew outdated 2>/dev/null | wc -l | tr -d ' ')"

case "${COUNT}" in
[3-9][0-9] | 100)
  COLOR=$RED
  ;;
[1-2][0-9])
  COLOR=$ORANGE
  ;;
[1-9])
  COLOR=$YELLOW
  ;;
*)
  COLOR=$COMMENT
  ;;
esac

sketchybar --set $NAME \
  icon= \
  label="$COUNT" \
  icon.color=$COLOR \
  label.color=$COLOR
