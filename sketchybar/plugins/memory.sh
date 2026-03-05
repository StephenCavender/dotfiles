#!/bin/bash

source "$CONFIG_DIR/scripts/config.sh"

# Get memory stats from vm_stat (values in pages, page size is 4096 bytes)
VM_STAT=$(vm_stat)
PAGE_SIZE=4096

pages_free=$(echo "$VM_STAT" | awk '/Pages free/ {gsub(/\./, "", $3); print $3}')
pages_active=$(echo "$VM_STAT" | awk '/Pages active/ {gsub(/\./, "", $3); print $3}')
pages_inactive=$(echo "$VM_STAT" | awk '/Pages inactive/ {gsub(/\./, "", $3); print $3}')
pages_wired=$(echo "$VM_STAT" | awk '/Pages wired down/ {gsub(/\./, "", $4); print $4}')
pages_compressed=$(echo "$VM_STAT" | awk '/Pages occupied by compressor/ {gsub(/\./, "", $5); print $5}')

# Total physical memory in pages
TOTAL_MEM_BYTES=$(sysctl -n hw.memsize)
TOTAL_PAGES=$((TOTAL_MEM_BYTES / PAGE_SIZE))

# Used = active + wired + compressed
USED_PAGES=$((pages_active + pages_wired + pages_compressed))
MEM_PERCENT=$(echo "$USED_PAGES $TOTAL_PAGES" | awk '{printf "%.0f\n", ($1 / $2) * 100}')

case "${MEM_PERCENT}" in
9[0-9] | 100)
  COLOR=$RED
  ;;
[7-8][0-9])
  COLOR=$ORANGE
  ;;
[5-6][0-9])
  COLOR=$YELLOW
  ;;
*)
  COLOR=$GREEN
  ;;
esac

sketchybar --set $NAME \
  label="$MEM_PERCENT%" \
  icon= \
  icon.color=$COLOR \
  label.color=$COLOR
