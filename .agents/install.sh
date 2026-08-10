#!/bin/bash
#
# Universal agent rules.
#
# One canonical ruleset, symlinked into each harness's global config location
# under whatever filename that harness looks for. Same pattern as the in-repo
# guides (.rules + per-harness symlinks), applied to the global layer.
#
# Centralised here because four harnesses need the identical three lines.
# Previously opencode/install.sh and pi/install.sh each carried their own copy;
# adding Claude Code and Gemini would have made four.
#
# The canonical file keeps the name AGENTS.universal.md rather than .rules on
# purpose: root .rules means "how to work in this repo", this means "how to work
# in every repo". Naming both .rules would make this read like a directory guide
# for .agents/ and double-load it for agents working in here.
#
# Paths per each tool's docs:
#   opencode      ~/.config/opencode/AGENTS.md
#   pi            ~/.pi/agent/AGENTS.md
#   Claude Code   ~/.claude/CLAUDE.md          (user-scope memory)
#   Gemini CLI    ~/.gemini/GEMINI.md          (global context)
#
# Gemini is wired even when the CLI is absent. A directory holding one symlink
# costs nothing, and the alternative — skip now, wire on some later re-run — is
# the failure mode where a tool gets installed and silently picks up no rules.

set -e

AGENTS_DIR="$(cd "$(dirname "$0")" && pwd)"
RULES="$AGENTS_DIR/AGENTS.universal.md"

# dest path per harness. Filename is what that harness reads, not a preference.
TARGETS=(
  "$HOME/.config/opencode/AGENTS.md"
  "$HOME/.pi/agent/AGENTS.md"
  "$HOME/.claude/CLAUDE.md"
  "$HOME/.gemini/GEMINI.md"
)

if [ ! -f "$RULES" ]; then
  echo "  !! $RULES not found — nothing to link" >&2
  exit 1
fi

for dest in "${TARGETS[@]}"; do
  mkdir -p "$(dirname "$dest")"

  if [ -L "$dest" ]; then
    if [ "$(readlink "$dest")" = "$RULES" ]; then
      echo "  ok: $dest"
    else
      ln -sfn "$RULES" "$dest"
      echo "  relinked: $dest"
    fi
    continue
  fi

  # Never clobber a real file — it may hold rules this repo does not know about.
  if [ -e "$dest" ]; then
    echo "  !! $dest exists and is not a symlink — leaving it alone." >&2
    echo "     Merge it into $RULES, then delete it to adopt the shared copy." >&2
    continue
  fi

  ln -sfn "$RULES" "$dest"
  echo "  linked: $dest"
done

echo "✅ Universal rules wired -> .agents/AGENTS.universal.md"
