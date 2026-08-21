#!/usr/bin/env bash
#
# tmux-resurrect restores window layout + pane title verbatim, including the
# tmux-pane-tree sidebar's pane slot - but it does NOT restore custom pane
# options, so the restored "Sidebar" pane loses the @tmux_sidebar_owned marker
# tmux-pane-tree uses to recognize its own pane. Pane-tree's ensure-sidebar-pane
# hook can't tell that pane is "already the sidebar", so it creates a second,
# real one - leaving the first as an orphaned duplicate.
#
# Run as @resurrect-hook-post-restore-all: kill any pane titled "Sidebar" (or
# the legacy "tmux-sidebar") that lacks the marker. Pane-tree's own hooks then
# create exactly one real sidebar per window.

tmux list-panes -a -F '#{pane_id} #{pane_title} #{@tmux_sidebar_owned}' |
	awk '($2 == "Sidebar" || $2 == "tmux-sidebar") && $3 != "1" { print $1 }' |
	while read -r pane_id; do
		tmux kill-pane -t "$pane_id" 2>/dev/null || true
	done
