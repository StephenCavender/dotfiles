#!/bin/bash

# Tokyo Night Color Scheme for Sketchybar (matches Omarchy's tokyo-night theme)
# https://github.com/folke/tokyonight.nvim
# Variable names kept from the previous Dracula palette so items/plugins are unchanged.

# Font configuration
export FONT="JetBrainsMono Nerd Font Mono"

# ============================================
# Tokyo Night Palette
# ============================================

# Base colors
export BG=0xff1a1b26              # Background
export FG=0xffa9b1d6              # Foreground
export CURRENT_LINE=0xff292e42    # Selection / current line
export COMMENT=0xff565f89         # Comment
export SELECTION=0xff292e42       # Selection

# Accent colors
export CYAN=0xff7dcfff            # Cyan
export GREEN=0xff9ece6a           # Green
export ORANGE=0xffff9e64          # Orange
export PINK=0xfff7768e            # Pink (Tokyo Night red-pink)
export PURPLE=0xff7aa2f7          # Primary accent (Tokyo Night blue)
export RED=0xfff7768e             # Red
export YELLOW=0xffe0af68          # Yellow

# ============================================
# Transparency Variants
# ============================================

# Background with transparency
export BG_80=0xcc1a1b26           # 80% opacity
export BG_60=0x991a1b26           # 60% opacity
export BG_40=0x661a1b26           # 40% opacity
export BG_20=0x331a1b26           # 20% opacity

# Accent with transparency
export PURPLE_80=0xcc7aa2f7       # 80% opacity
export PURPLE_60=0x997aa2f7       # 60% opacity
export PURPLE_40=0x667aa2f7       # 40% opacity
export PURPLE_20=0x337aa2f7       # 20% opacity

# Pink with transparency
export PINK_80=0xccf7768e         # 80% opacity
export PINK_60=0x99f7768e         # 60% opacity
export PINK_40=0x66f7768e         # 40% opacity

# Cyan with transparency
export CYAN_80=0xcc7dcfff         # 80% opacity
export CYAN_60=0x997dcfff         # 60% opacity
export CYAN_40=0x667dcfff         # 40% opacity

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
