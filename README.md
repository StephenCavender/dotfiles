# Stephen Cavender's Dotfiles

[dotfile setup](https://dotfiles.github.io) forked from [dan holman's dotfiles](https://github.com/holman/dotfiles). Be sure to read his [post](https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked) on the subject.

## Quick Start

```bash
curl -fsSL https://raw.githubusercontent.com/StephenCavender/dotfiles/master/install.sh | sh
```

The script installs Xcode Command Line Tools, clones the repo, and runs `./script/bootstrap`.

Or manually:

```bash
git clone https://github.com/StephenCavender/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./script/bootstrap
```

## Features

### AI Agent Toolkit

Skills and universal rules live in a harness-neutral `.agents/` directory so multiple coding agents (OpenCode, [pi](https://pi.dev), caveman) can share one source of truth. OpenCode-specific commands stay under `opencode/`. Each harness's `install.sh` symlinks the shared `.agents/skills` into its own config location.

- **Skills** (`.agents/skills/`): `audit-context` (trim agent instruction bloat), `clarify` (Socratic interrogation), `github-cli` (gh CLI in place of the GitHub MCP), `init-agents` (scaffold AGENTS.md), `plan`, `refine`, `reground`, `tdd-loop`
- **Commands** (`opencode/command/`): `review`, `security-audit`, `a11y-audit`, `remove-slop`, `commit`, `spec`
- **Harnesses**: `opencode/` and `pi/` each carry an `install.sh` that wires the shared skills + `AGENTS.universal.md` into the right place. pi is installed separately via `curl -fsSL https://pi.dev/install.sh | sh`.

### Shell Environment

- **Zsh** with powerline-style prompt (Starship), [eza](https://eza.rocks) aliases replacing legacy `ls`, and extensive aliases (`mkd`, `diff`, `v`, `ka`, `k`, `lg`, `dates`, and more)
- **LazyGit** integration for terminal-based Git browsing

### Editor & Terminal

- **Neovim** — LazyVim distribution, tracked in-repo with autocmds, transparent Dracula theme
- **Ghostty** — terminal emulator config with Challenger Deep theme, custom padding and window decorations
- **Tmux** — transparent background, sensible defaults
- **Vim & Zed** — additional editor configs

### Git Workflow

Custom scripts for branch management, conflict resolution, and productivity:

- `git-fuzzy-checkout` / `git-fuzzy-merge` — interactive branch selection
- `git-promote` — promote branch through environments
- `git-clone-worktree` — clone into isolated worktree
- `git-nuke` — clean up stale branches

### macOS Optimization

- **System Settings**: Automated macOS defaults for better developer experience
- **Path Management**: Intelligent PATH configuration for all tools
- **Completion**: Comprehensive tab completion for shells and tools

## Structure

```
.dotfiles/
├── install.sh          # Remote bootstrap (curl pipe)
├── .agents/            # Harness-neutral skills + universal rules (shared)
├── opencode/           # OpenCode commands + install.sh
├── pi/                 # pi config + install.sh
├── bin/                # Custom scripts and utilities
├── zsh/                # Shell configuration
├── git/                # Git configuration and aliases
├── nvim/               # Neovim (LazyVim) config
├── vim/                # Legacy Vim configuration
├── ghostty/            # Ghostty terminal config
├── tmux/               # Tmux configuration
├── system/             # System-wide settings
└── script/             # Installation and setup scripts
```

## Management

```bash
bin/dot                 # Pull latest + run install + update brew
bin/dot -e              # Open dotfiles directory in $EDITOR
```

## Inspiration

- [Kainoa-h/MacSetup](https://github.com/Kainoa-h/MacSetup)
- [Zack Reed's dotfiles](https://github.com/rubylaser/dotfiles)
- [paulalden's dotfiles](https://github.com/paulalden/dotfiles) — Sketchybar configuration
