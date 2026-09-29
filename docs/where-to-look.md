# Where to look

| Task | Location |
|------|----------|
| Add a shell alias | `zsh/aliases.zsh` or `system/aliases.zsh` |
| Add PATH entry | `system/_path.zsh` |
| Add env var | `system/env.zsh` |
| Add zsh function | `functions/` (autoloaded) |
| Add Homebrew package | `Brewfile` |
| Add macOS default | `macos/set-defaults.sh` |
| Add launchd agent | `macos/startup-config.sh` |
| Add new tool config | New subdirectory with `*.symlink` and/or `install.sh` (never a top-level file) |
| Add opencode command | `opencode/command/<name>.md` |
| Add agent skill | `.agents/skills/<name>/SKILL.md` (shared by opencode, pi, Claude, Gemini) |
| Change package cooldown window | `supply-chain/` (npm/pnpm/bun/pip minimum release age) |
