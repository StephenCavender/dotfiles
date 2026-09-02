#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"

  case "$VOLUME" in
  [7-9][0-9] | 100)
    ICON=""
    ;;
  [2-6][0-9])
    ICON=""
    ;;
  [1-9] | [1-1][0-9])
    ICON=""
    ;;
  *)
    ICON=""
    ;;
  esac

  sketchybar --set "$NAME" \
    icon="$ICON" \
    icon.font="$FONT:Bold:20.0" \
    icon.color=$FG
fi
