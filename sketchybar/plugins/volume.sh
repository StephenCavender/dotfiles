#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"

  case "$VOLUME" in
  [7-9][0-9] | 100)
    ICON=""
    COLOR=$RED
    ;;
  [2-6][0-9])
    ICON=""
    COLOR=$ORANGE
    ;;
  [1-9] | [1-1][0-9])
    ICON=""
    COLOR=$GREEN
    ;;
  *)
    ICON=""
    COLOR=$FG
    ;;
  esac

  sketchybar --set "$NAME" \
    icon="$ICON" \
    label="$VOLUME%" \
    icon.font="$FONT:Bold:20.0" \
    icon.color=$COLOR \
    label.color=$COLOR
fi
