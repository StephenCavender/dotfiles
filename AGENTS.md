# Dotfiles Repository Guide

**Stack**: macOS dotfiles · Zsh · Bash · Ruby · Homebrew · opencode AI toolkit

Task-specific file locations: [docs/where-to-look.md](docs/where-to-look.md)

## CRITICAL MECHANICS

- `*.symlink` files → `~/.<basename>` (e.g. `zsh/zshrc.symlink` → `~/.zshrc`)
- Private env vars → `~/.localrc` only — never in repo files
- Zsh load order: `*.path.zsh` first → all other `*.zsh` → `compinit` → `*.completion.zsh`
- Don't `cd` inside scripts — use subshells or `$DOTFILES_ROOT`-relative paths
- `.agents/install.sh` wires universal rules into every harness; `opencode/install.sh` installs commands + symlinks `.agents/skills` — run after changes

## CONVENTIONS

- `.local` suffix = user-private, gitignored
- Each tool dir: `install.sh` for one-time setup, `*.zsh` for shell integration
- SSH enforced over HTTPS for github/gitlab/bitbucket (url rewrites in gitconfig)
- Default branch: `master`

## COMMANDS

```bash
./script/bootstrap          # Full install (first time)
./script/install            # Reinstall all tools
./script/install --work     # Include Brewfile.work
bin/dot                     # Update everything (pull + brew + install)
macos/set-defaults.sh       # Apply macOS system defaults
```
