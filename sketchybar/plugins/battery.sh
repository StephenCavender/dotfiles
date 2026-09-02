#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

BATT="$(pmset -g batt)"
PERCENTAGE="$(echo "$BATT" | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(echo "$BATT" | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

FONT_SIZE=15

case "${PERCENTAGE}" in
[8-9][0-9] | 100)
  ICON="󱊣"
  ;;
[6-7][0-9])
  ICON="󱊢"
  ;;
[3-5][0-9])
  ICON="󱊢"
  ;;
[1-2][0-9])
  ICON="󱊡"
  ;;
*)
  ICON="󰂎"
  ;;
esac

if [[ "$CHARGING" != "" ]]; then
  case "${PERCENTAGE}" in
  9[0-9] | 100)
    ICON="󱊦"
    ;;
  [6-8][0-9])
    ICON="󱊥"
    ;;
  [3-5][0-9])
    ICON="󱊥"
    ;;
  [1-2][0-9])
    ICON="󱊤"
    ;;
  *)
    ICON="󰢟"
    ;;
  esac
  FONT_SIZE=20
fi

sketchybar --set "$NAME" \
  icon="$ICON" \
  icon.font="$FONT:Bold:$FONT_SIZE.0" \
  icon.color=$FG
