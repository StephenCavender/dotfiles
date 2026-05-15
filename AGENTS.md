# AGENTS.md — Dotfiles Repository Guide

**Stack**: macOS dotfiles · Zsh · Bash · Ruby · Homebrew · opencode AI toolkit

## WHERE TO LOOK

| Task | Location |
|------|----------|
| Add a shell alias | `zsh/aliases.zsh` or `system/aliases.zsh` |
| Add PATH entry | `system/_path.zsh` |
| Add env var | `system/env.zsh` |
| Add zsh function | `functions/` (autoloaded) |
| Add custom binary/script | `bin/` |
| Add Homebrew package | `Brewfile` |
| Add macOS default | `macos/set-defaults.sh` |
| Add launchd agent | `macos/startup-config.sh` |
| Add new tool config | New subdirectory with `*.symlink` and/or `install.sh` |
| Add AI agent | `opencode/agent/<domain>/<name>.md` |
| Add slash command | `opencode/command/<domain>/<name>.md` |
| Private env vars | `~/.localrc` (never in repo) |
| Email config | `mutt/` |
| Calendar config | `calendar/` |

## STRUCTURE

```
.dotfiles/
├── script/         # bootstrap (entry point) + install (runs brew + install.sh files)
├── bin/            # Custom scripts: git-*, dns-flush, search, todo, worktree-*
├── zsh/            # zshrc.symlink + modular *.zsh files (loaded by zshrc)
├── git/            # gitconfig.symlink, gitignore.symlink, aliases.zsh
├── system/         # _path.zsh, aliases.zsh, env.zsh, grc.zsh, keys.zsh
├── functions/      # Autoloaded zsh functions
├── opencode/       # AI agents (opencode/agent/) + slash commands (opencode/command/)
├── sketchybar/     # macOS status bar: items/, plugins/, sketchybarrc
├── macos/          # set-defaults.sh, set-hostname.sh, startup-config.sh
├── homebrew/       # install.sh + path.zsh
├── ghostty/        # Terminal config + themes/
├── tmux/           # tmux.conf.symlink + install.sh (TPM + tmux-resurrect)
├── nvim/           # install.sh (config lives at ~/.config/nvim)
├── mutt/           # neomutt config (Fastmail)
├── calendar/       # khal + vdirsyncer config (Fastmail CalDAV)
├── ruby/           # gemrc.symlink, irbrc.symlink, rbenv setup
├── nvm/            # env.zsh + install.sh
└── Brewfile        # Homebrew packages; Brewfile.work for work-specific packages
```

## INSTALLATION FLOW

```bash
./script/bootstrap    # 1. setup gitconfig → 2. link *.symlink → 3. set shell → 4. runs bin/dot
./script/install      # brew bundle + runs all install.sh files (--work for Brewfile.work)
bin/dot               # git pull + macos defaults + homebrew update/upgrade + script/install
```

Symlinks: `*.symlink` → `~/.<basename>` (e.g. `zsh/zshrc.symlink` → `~/.zshrc`)
Local overrides: `~/.localrc` (sourced by zshrc, never committed)

## CONVENTIONS

**Shell scripts**
- Shebang: `#!/usr/bin/env bash` (complex) or `#!/bin/sh` (simple/install.sh)
- `set -e` at top of every script
- 2-space indentation, no tabs
- `UPPER_SNAKE_CASE` for exports, `lower_snake_case` for locals

**Config files**
- `.symlink` extension = will be linked to `~/.<name>` by bootstrap
- `.local` suffix = user-private, excluded from repo (gitignore)
- Each tool dir: `install.sh` for one-time setup, `*.zsh` for shell integration

**Git**
- SSH enforced over HTTPS for github/gitlab/bitbucket (url rewrites in gitconfig)
- GPG signing enabled (SSH key format), signing key: `~/.ssh/id_ed25519.pub`
- Default branch: `master`

## ZSH LOADING ORDER

```
zshenv → zshrc:
  1. *.path.zsh      (PATH setup — loaded first)
  2. all other *.zsh (except path/completion)
  3. compinit
  4. *.completion.zsh (loaded last)
```

## ANTI-PATTERNS

- Don't put private env vars in repo files — use `~/.localrc`
- Don't `cd` inside scripts — use subshells or `$DOTFILES_ROOT`-relative paths
- Don't add new tool config as a top-level file — use a subdirectory
- `opencode/install.sh` is currently disabled — don't re-enable without testing

## COMMANDS

```bash
./script/bootstrap          # Full install (first time)
./script/install            # Reinstall all tools
./script/install --work     # Include Brewfile.work
bin/dot                     # Update everything (pull + brew + install)
macos/set-defaults.sh       # Apply macOS system defaults
```
