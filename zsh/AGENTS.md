# zsh/ — Shell Configuration

`zshrc.symlink` is the entry point → `~/.zshrc`. All `*.zsh` files under `$ZSH` (the entire dotfiles dir) are auto-sourced.

## FILES

| File | Purpose |
|------|---------|
| `zshrc.symlink` | Entry point: sets `$ZSH`, sources `~/.localrc`, loads all `*.zsh` files |
| `zshenv.symlink` | Sources `~/.zshrc` unconditionally (for non-interactive shells) |
| `aliases.zsh` | Zsh-specific aliases (reload config, etc.) |
| `completion.zsh` | Completion config — loaded last (after compinit) |
| `config.zsh` | Core zsh options: history, keybindings, fpath, autoload functions |
| `fpath.zsh` | Additional fpath entries |
| `prompt.zsh` | Prompt setup (Starship) |
| `window.zsh` | Terminal window title behavior |

## LOADING ORDER

```
zshenv → zshrc:
  1. */path.zsh     (PATH setup — loaded first)
  2. */!(path|completion).zsh  (everything else)
  3. compinit
  4. */completion.zsh  (completions — loaded last)
```

This applies to ALL `*.zsh` files in ALL subdirectories under `$ZSH`, not just `zsh/`.

## CONVENTIONS

- Name files `path.zsh` for PATH-only setup (loaded first)
- Name files `completion.zsh` for completion setup (loaded last)
- Everything else loads in the middle — order within that group is not guaranteed
- `~/.localrc` = private env vars / machine-specific config (never committed)
- `$PROJECTS` = `~/code` (used by `c` function for directory jumping)

## NOTES

- `thefuck` is lazy-loaded — the `fuck()` function bootstraps itself on first call. Don't eager-load it.
- `fzf`, `zoxide`, `mise` are conditionally activated at end of `zshrc.symlink`
- Functions in `functions/` are autoloaded via `autoload -U $ZSH/functions/*(:t)` in `config.zsh`
- History: 10000 entries, shared across sessions, deduped
