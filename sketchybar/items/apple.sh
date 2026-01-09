#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

POPUP_OFF='sketchybar --set apple.logo popup.drawing=off'
POPUP_CLICK_SCRIPT='sketchybar --set $NAME popup.drawing=toggle'

APPLE=""
PREFERENCES=""
LOCK=""
ACTIVITY="󱎴"

apple_logo=(
  icon=$APPLE
  icon.font="$FONT:Bold:22.0"
  icon.color=$PURPLE
  padding_right=15
  label.drawing=off
  popup.height=35
  background.color=$BG_60
  background.border_color=$PURPLE_40
  background.border_width=2
  background.corner_radius=8
  popup.background.color=$BG
  popup.background.border_color=$PURPLE_40
  popup.background.border_width=2
  popup.background.corner_radius=8
  click_script="$POPUP_CLICK_SCRIPT"
)

apple_prefs=(
  icon=$PREFERENCES
  icon.color=$CYAN
  label="Preferences"
  label.color=$FG
  click_script="open -a 'System Settings'; $POPUP_OFF"
)

apple_activity=(
  icon=$ACTIVITY
  icon.color=$GREEN
  label="Activity"
  label.color=$FG
  click_script="open -a 'Activity Monitor'; $POPUP_OFF"
)

apple_lock=(
  icon=$LOCK
  icon.color=$PINK
  label="Lock Screen"
  label.color=$FG
  click_script="pmset displaysleepnow; $POPUP_OFF"
)

sketchybar --add item apple.logo left \
  --set apple.logo "${apple_logo[@]}" \
  --add item apple.prefs popup.apple.logo \
  --set apple.prefs "${apple_prefs[@]}" \
  --add item apple.activity popup.apple.logo \
  --set apple.activity "${apple_activity[@]}" \
  --add item apple.lock popup.apple.logo \
  --set apple.lock "${apple_lock[@]}"
