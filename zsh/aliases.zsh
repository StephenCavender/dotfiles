alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

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
