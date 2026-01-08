#!/bin/bash

# Dracula Color Scheme for Sketchybar
# https://draculatheme.com/contribute

# Font configuration
export FONT="Hack Nerd Font Mono"

# ============================================
# Dracula Official Color Palette
# ============================================

# Base colors
export BG=0xff282a36              # Background
export FG=0xfff8f8f2              # Foreground
export CURRENT_LINE=0xff44475a    # Current Line
export COMMENT=0xff6272a4         # Comment
export SELECTION=0xff44475a       # Selection

# Accent colors
export CYAN=0xff8be9fd            # Cyan
export GREEN=0xff50fa7b           # Green
export ORANGE=0xffffb86c          # Orange
export PINK=0xffff79c6            # Pink
export PURPLE=0xffbd93f9          # Purple (primary accent)
export RED=0xffff5555             # Red
export YELLOW=0xfff1fa8c          # Yellow

# ============================================
# Transparency Variants
# ============================================

# Background with transparency
export BG_80=0xcc282a36           # 80% opacity
export BG_60=0x99282a36           # 60% opacity
export BG_40=0x66282a36           # 40% opacity
export BG_20=0x33282a36           # 20% opacity

# Purple with transparency
export PURPLE_80=0xccbd93f9       # 80% opacity
export PURPLE_60=0x99bd93f9       # 60% opacity
export PURPLE_40=0x66bd93f9       # 40% opacity
export PURPLE_20=0x33bd93f9       # 20% opacity

# Pink with transparency
export PINK_80=0xccff79c6         # 80% opacity
export PINK_60=0x99ff79c6         # 60% opacity
export PINK_40=0x66ff79c6         # 40% opacity

# Cyan with transparency
export CYAN_80=0xcc8be9fd         # 80% opacity
export CYAN_60=0x998be9fd         # 60% opacity
export CYAN_40=0x668be9fd         # 40% opacity

# Transparent
export TRANSPARENT=0x00000000

# ============================================
# Semantic Color Assignments
# ============================================

export BAR_COLOR=$BG              # Bar background
export ITEM_BG_COLOR=$CURRENT_LINE # Item backgrounds
export ACCENT_COLOR=$PURPLE       # Primary accent
export TEXT_COLOR=$FG             # Primary text
export MUTED_COLOR=$COMMENT       # Muted/secondary text
