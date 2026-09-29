# Dotfiles Repository Guide

**Stack**: macOS dotfiles · Zsh · Bash · Ruby · Homebrew · opencode AI toolkit

## WHERE TO LOOK

| Task | Location |
|------|----------|
| Add a shell alias | `zsh/aliases.zsh` or `system/aliases.zsh` |
| Add PATH entry | `system/_path.zsh` |
| Add env var | `system/env.zsh` |
| Add zsh function | `functions/` (autoloaded) |
| Add Homebrew package | `Brewfile` |
| Add macOS default | `macos/set-defaults.sh` |
| Add launchd agent | `macos/startup-config.sh` |
| Add new tool config | New subdirectory with `*.symlink` and/or `install.sh` |
| Add opencode command | `opencode/command/<name>.md` |
| Add agent skill | `.agents/skills/<name>/SKILL.md` (shared by opencode, pi, Claude, Gemini) |
| Change package cooldown window | `supply-chain/` (npm/pnpm/bun/pip minimum release age) |
| Private env vars | `~/.localrc` (never in repo) |

## CRITICAL MECHANICS

- `*.symlink` files → `~/.<basename>` (e.g. `zsh/zshrc.symlink` → `~/.zshrc`)
- Private env vars → `~/.localrc` only — never in repo files
- Zsh load order: `*.path.zsh` first → all other `*.zsh` → `compinit` → `*.completion.zsh`
- `.agents/install.sh` wires universal rules into every harness; `opencode/install.sh` installs commands + symlinks `.agents/skills` — run after changes

## CONVENTIONS

- `.symlink` extension = linked to `~/.<name>` by bootstrap
- `.local` suffix = user-private, gitignored
- Each tool dir: `install.sh` for one-time setup, `*.zsh` for shell integration
- SSH enforced over HTTPS for github/gitlab/bitbucket (url rewrites in gitconfig)
- Default branch: `master`

## ANTI-PATTERNS

- Don't put private env vars in repo files — use `~/.localrc`
- Don't `cd` inside scripts — use subshells or `$DOTFILES_ROOT`-relative paths
- Don't add new tool config as a top-level file — use a subdirectory

## COMMANDS

```bash
./script/bootstrap          # Full install (first time)
./script/install            # Reinstall all tools
./script/install --work     # Include Brewfile.work
bin/dot                     # Update everything (pull + brew + install)
macos/set-defaults.sh       # Apply macOS system defaults
```
