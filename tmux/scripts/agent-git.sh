#!/usr/bin/env bash
#
# Git state for panes running an AI coding agent, for the tmux status bar.
#
# The pure prompt already shows branch + dirty state for the pane you are
# typing in. This covers the panes you are NOT typing in - where an agent is
# mutating a repo unattended. Repos are deduped, so N agent panes in one repo
# cost one git call.
#
# Usage: agent-git.sh <session-name>   (called from status-right)

set -uo pipefail

session="${1:-}"
[ -n "$session" ] || exit 0

# Commands that mean "an agent is driving this pane".
agent_pattern='^(opencode|claude|codex|pi|kiro|aider|gemini)$'

opt() { tmux show -gv "@$1" 2>/dev/null; }

c_comment="$(opt c_comment)"
c_fg="$(opt c_fg)"
c_orange="$(opt c_orange)"

panes="$(tmux list-panes -s -t "$session" \
  -F '#{pane_current_command}|#{pane_current_path}' 2>/dev/null)" || exit 0
[ -n "$panes" ] || exit 0

# bash 3.2 on macOS has no associative arrays - track seen repos in a string.
seen="|"
out=""

while IFS='|' read -r cmd path; do
  [[ "$cmd" =~ $agent_pattern ]] || continue
  [ -n "$path" ] || continue

  root="$(git -C "$path" rev-parse --show-toplevel 2>/dev/null)" || continue
  [ -n "$root" ] || continue
  case "$seen" in
    *"|$root|"*) continue ;;
  esac
  seen="${seen}${root}|"

  branch="$(git -C "$root" symbolic-ref --quiet --short HEAD 2>/dev/null \
    || git -C "$root" rev-parse --short HEAD 2>/dev/null)" || continue
  [ -n "$branch" ] || continue

  dirty=""
  if [ -n "$(git -C "$root" status --porcelain --ignore-submodules -unormal 2>/dev/null | head -1)" ]; then
    dirty="*"
  fi

  out="${out}#[fg=${c_comment}]${cmd} #[fg=${c_fg}]${root##*/}#[fg=${c_comment}]:${branch}#[fg=${c_orange}]${dirty}#[fg=${c_comment}]  "
done <<EOF
$panes
EOF

printf '%s' "$out"
