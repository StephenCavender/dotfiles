# Cache rbenv's init output; regenerate only when the binary changes.
# Avoids spawning `rbenv init` (~50-80ms) on every shell startup.
if (( $+commands[rbenv] ))
then
  _rbenv_cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/rbenv.zsh"
  mkdir -p "${_rbenv_cache:h}"
  if [[ ! -f $_rbenv_cache || ${commands[rbenv]} -nt $_rbenv_cache ]]; then
    rbenv init - zsh > $_rbenv_cache
  fi
  source $_rbenv_cache
  unset _rbenv_cache
fi
