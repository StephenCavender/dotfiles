#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

if [ "$SENDER" = "brightness_change" ]; then
  BRIGHTNESS="$INFO"

  case "$BRIGHTNESS" in
  [7-9][0-9] | 100)
    ICON="󰃠"
    ;;
  [3-6][0-9])
    ICON="󰃝"
    ;;
  [1-2][0-9])
    ICON="󰃟"
    ;;
  *)
    ICON="󰃞"
    ;;
  esac

  sketchybar --set "$NAME" \
    icon="$ICON" \
    label="$BRIGHTNESS%" \
    icon.font="$FONT:Bold:20.0" \
    icon.color=$ORANGE \
    label.color=$ORANGE
fi
