alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

# Filesystem
alias mkd='mkdir -pv'
alias diff='diff --color=auto'

# Kubernetes
alias k='kubectl'

# Dates (macOS BSD date compatible — no GNU-only flags)
alias dt='date +%Y%m%d'                      # 20260515
alias dts='date +%s'                          # epoch seconds: 1452795263
alias dti='date +%Y%m%dT%H%M%S'              # compact ISO-ish: 20260515T143022
alias dti-='date -u +%Y-%m-%dT%H:%M:%SZ'     # ISO 8601 UTC: 2026-05-15T14:30:22Z
alias dttm='date -u +%Y%m%d%H%M%S'           # datetime: 20260515143022
alias dtp='date +%Y-%m-%d'                   # readable date: 2026-05-15
alias dto='date +%Y%j'                        # ordinal: 2026135
alias dtwk='date +W%V'                        # week: W20
alias dtyrwk='date +%GW%V'                   # year-week: 2026W20

export icloud=~/Library/Mobile\ Documents/com~apple~CloudDocs
export fastmail=~/fastmail-cloud

alias fastmail-sync="rclone bisync fastmail: ~/fastmail-cloud --log-file ~/.local/share/rclone/fastmail-sync.log"

alias cal="khal calendar"
alias agenda="khal list"
alias ical="ikhal"
alias cal-sync="vdirsyncer sync"

# fcd - cd to selected directory
# With no arg: fzf over top-level dirs (original behavior)
# With arg: cd into best matching subdir; falls back to fzf if no match
fcd() {
  if [[ -z "$1" ]]; then
    DIR=`find * -maxdepth 0 -type d -print 2> /dev/null | fzf-tmux` \
      && cd "$DIR"
  else
    local match
    match=$(find * -maxdepth 0 -type d -print 2> /dev/null | grep -i "$1" | head -1)
    if [[ -n "$match" ]]; then
      cd "$match"
    else
      DIR=`find * -maxdepth 0 -type d -print 2> /dev/null | fzf-tmux` \
        && cd "$DIR"
    fi
  fi
}

# fda - including hidden directories
fcda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}
