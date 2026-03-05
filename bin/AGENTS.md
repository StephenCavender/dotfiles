# bin/ — Custom Scripts & Utilities

32 executable scripts. All are on `$PATH` via `system/_path.zsh` (`$ZSH/bin`).

## SCRIPTS

**Git utilities** (prefix `git-` = callable as `git <name>`):
| Script | Purpose |
|--------|---------|
| `git-fuzzy-checkout` | Interactive branch selection via fzf |
| `git-fuzzy-merge` | Interactive merge target selection |
| `git-wtf` | Repository status overview (Ruby) |
| `git-rank-contributors` | Contribution stats by author (Ruby) |
| `git-promote` | Merge current branch to master |
| `git-delete-local-merged` | Remove merged local branches |
| `git-nuke` | Force-delete local + remote branch |
| `git-unpushed` | List commits not pushed to remote |
| `git-unpushed-stat` | Same with file stats |
| `git-up` | Fetch + rebase current branch |
| `git-amend` | Amend last commit (add staged changes) |
| `git-undo` | Undo last commit (keep changes staged) |
| `git-track` | Set upstream tracking for current branch |
| `git-credit` | Add co-author to last commit |
| `git-conflicts` | List files with merge conflicts |
| `git-edit-new` | Open untracked files in $EDITOR |
| `git-clone-worktree` | Clone repo into worktree layout |
| `git-purge-local` | Delete all local branches not on remote |
| `git-copy-branch-name` | Copy current branch name to clipboard |
| `gitio` | Create git.io shortlink (Ruby) |

**System utilities**:
| Script | Purpose |
|--------|---------|
| `dot` | Update dotfiles (git pull + brew + install) |
| `dns-flush` | Flush macOS DNS cache |
| `search` | Quick file content search |
| `todo` | Simple task management |
| `set-defaults` | Apply macOS system defaults |
| `battery-status` | Show battery percentage |
| `headers` | Print HTTP response headers for URL |
| `worktree-rm` | Remove a git worktree |
| `worktree-switch` | Switch between git worktrees |
| `a` | Quick alias shortcut |
| `e` | Open file in $EDITOR |
| `yt` | Download YouTube video/audio |

## CONVENTIONS

- Shebang: `#!/bin/sh` (most), `#!/usr/bin/env bash` (bash-specific), `#!/usr/bin/env ruby` (git-wtf, git-rank-contributors, gitio)
- `set -e` at top
- Standard header doc:
  ```sh
  #!/bin/sh
  #
  # Brief description
  #
  # $1 - first param description
  #
  # Examples
  #   git credit "Name" email@example.com
  ```
- `git-*` scripts are invokable as `git <name>` (Git auto-discovers `git-*` on PATH)

## ANTI-PATTERNS

- Don't add scripts that duplicate existing git aliases in `git/gitconfig.symlink`
- Don't use `cd` inside scripts — use explicit paths from `$DOTFILES_ROOT` or subshells
