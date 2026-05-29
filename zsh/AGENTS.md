# zsh/

`zshrc.symlink` → `~/.zshrc` (entry point). All `*.zsh` files under `$ZSH` (the entire dotfiles dir) are auto-sourced.

## Loading Order

```
zshenv → zshrc:
  1. */path.zsh                  (PATH — loaded first)
  2. */!(path|completion).zsh    (everything else, order not guaranteed)
  3. compinit
  4. */completion.zsh            (completions — loaded last)
```

## Notes

- `thefuck` is lazy-loaded — bootstraps on first call. Don't eager-load it.
- `fzf`, `zoxide`, `mise` are conditionally activated at end of `zshrc.symlink`
- Functions in `functions/` autoloaded via `autoload -U $ZSH/functions/*(:t)` in `config.zsh`
- `$PROJECTS` = `~/code` (used by `c` function for directory jumping)
- `~/.localrc` = private/machine-specific config (never committed)
