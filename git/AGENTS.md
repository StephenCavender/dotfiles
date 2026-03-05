# git/ — Git Configuration

## FILES

| File | Purpose |
|------|---------|
| `gitconfig.symlink` | Main git config → `~/.gitconfig` |
| `gitconfig.local.symlink` | Private config (author name/email) → `~/.gitconfig.local` |
| `gitconfig.local.symlink.example` | Template — bootstrap generates `.local` from this |
| `gitignore.symlink` | Global gitignore → `~/.gitignore` |
| `attributes` | Git attributes (diff drivers) |
| `aliases.zsh` | Shell aliases wrapping git commands |
| `completion.zsh` | Git tab completion |

## KEY SETTINGS

- **SSH enforced**: URL rewrites for github.com, gitlab.com, bitbucket.org (https → ssh)
- **GPG signing**: `gpgsign = true`, format = `ssh`, key = `~/.ssh/id_ed25519.pub`
- **Default branch**: `master`
- **Pull strategy**: `rebase = false` (merge)
- **Auto-prune**: `fetch.prune = true`
- **Diff driver**: `spaceman-diff` for image diffs

## GIT ALIASES (in gitconfig.symlink)

| Alias | Resolves to |
|-------|-------------|
| `co` | `checkout` |
| `promote` | `bin/git-promote` |
| `wtf` | `bin/git-wtf` |
| `rank-contributors` | `bin/git-rank-contributors` |
| `count` | `shortlog -sn` |

## CONVENTIONS

- Private config (name, email) lives in `gitconfig.local.symlink` — never commit real values
- `gitconfig.local.symlink` is gitignored; `gitconfig.local.symlink.example` is the committed template
- Bootstrap auto-generates `.local` from `.example` if it doesn't exist

## ANTI-PATTERNS

- Don't put author name/email in `gitconfig.symlink` — use `gitconfig.local.symlink`
- Don't disable SSH enforcement (url rewrites)
