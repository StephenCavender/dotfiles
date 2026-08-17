#!/bin/bash
#
# Aggregate AI-agent state from tmux-pane-tree into one menu bar item.
#
# tmux-pane-tree writes per-pane state JSON when an agent changes status. Its
# sidebar shows those badges inside tmux - useless when the terminal is not the
# focused aerospace workspace. This surfaces the same state in the menu bar,
# which is always visible.
#
# Usage: agents.sh          (item script, refreshes the label)
#        agents.sh jump     (click_script, focuses the pane that needs input)

source "$CONFIG_DIR/scripts/config.sh"

STATE_DIR="${TMUX_PANE_TREE_STATE_DIR:-${XDG_STATE_HOME:-$HOME/.local/state}/tmux-sidebar}"

hide() {
  sketchybar --set "$NAME" drawing=off
  exit 0
}

# Hidden only when there is nothing to count at all - no tmux, or no server
# running. Whenever tmux is up the item stays drawn, even at zero.
if ! command -v tmux >/dev/null 2>&1; then
  hide
fi

LIVE="$(tmux list-panes -a -F '#{pane_id}' 2>/dev/null)"
[ -n "$LIVE" ] || hide

# Status breakdown needs jq and the pane-tree state dir; the total does not.
# Missing either just means no busy states to report.
HAVE_STATE=0
if [ -d "$STATE_DIR" ] && command -v jq >/dev/null 2>&1; then
  HAVE_STATE=1
fi

# Only count panes that still exist - state files outlive their panes.
query_live='($live | split("\n")) as $ids
  | map(select(.pane_id as $p | $ids | index($p)))'

if [ "${1:-}" = "jump" ]; then
  [ "$HAVE_STATE" -eq 1 ] || exit 0
  # Prefer a pane waiting on input; fall back to a running one.
  PANE="$(jq -sr --arg live "$LIVE" "
    $query_live
    | (map(select(.status == \"needs-input\")) + map(select(.status == \"running\")))
    | .[0].pane_id // empty
  " "$STATE_DIR"/pane-*.json 2>/dev/null)"
  [ -n "$PANE" ] || exit 0

  SESSION="$(tmux display-message -p -t "$PANE" '#{session_name}' 2>/dev/null)" || exit 0
  CLIENT="$(tmux list-clients -F '#{client_name}' 2>/dev/null | head -1)"
  [ -n "$CLIENT" ] && tmux switch-client -c "$CLIENT" -t "$SESSION" 2>/dev/null
  tmux select-window -t "$PANE" 2>/dev/null
  tmux select-pane -t "$PANE" 2>/dev/null
  open -a Ghostty
  exit 0
fi

COUNTS=""
if [ "$HAVE_STATE" -eq 1 ]; then
  COUNTS="$(jq -sr --arg live "$LIVE" "
    $query_live
    | reduce .[] as \$p ({}; .[\$p.status] += 1)
    | \"\(.running // 0) \(.\"needs-input\" // 0) \(.error // 0)\"
  " "$STATE_DIR"/pane-*.json 2>/dev/null)"
fi

read -r RUNNING NEEDS ERRORS <<<"${COUNTS:-0 0 0}"

# Total agent panes alive, counted from tmux rather than the state files - a
# pane that has never reported a status still counts as an agent on screen.
# Same command set as tmux/scripts/agent-git.sh.
TOTAL="$(tmux list-panes -a -F '#{pane_current_command}' 2>/dev/null \
  | grep -cE '^(opencode|claude|codex|pi|kiro|aider|gemini)$')"
TOTAL="${TOTAL:-0}"

# Persistent count: the item stays drawn whenever tmux is up, so the number is
# always where you expect it. Busy states are appended, not substituted.
LABEL="$TOTAL"
[ "${NEEDS:-0}" -gt 0 ] && LABEL="${LABEL} - ${NEEDS} ask"
[ "${RUNNING:-0}" -gt 0 ] && LABEL="${LABEL} - ${RUNNING} run"
[ "${ERRORS:-0}" -gt 0 ] && LABEL="${LABEL} - ${ERRORS} err"

# Urgency drives colour: needs-input is the only state you must act on.
# Idle stays dim so a persistent item does not read as an alert.
if [ "${NEEDS:-0}" -gt 0 ]; then
  COLOR=$PINK
elif [ "${ERRORS:-0}" -gt 0 ]; then
  COLOR=$RED
elif [ "${RUNNING:-0}" -gt 0 ]; then
  COLOR=$YELLOW
elif [ "$TOTAL" -gt 0 ]; then
  COLOR=$CYAN
else
  COLOR=$COMMENT
fi

sketchybar --set "$NAME" \
  drawing=on \
  label="$LABEL" \
  icon.color="$COLOR" \
  label.color="$COLOR"
