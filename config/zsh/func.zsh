#!/bin/zsh

# source file
include_source() {
  [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

# if file_exists file; then
file_exists() {
  [ -e "$1" ]
}
# if is_command_present abc; then
is_command_present() {
  command -v "$1" > /dev/null 2>&1
}

is_tmux_enabled() {
  is_command_present tmux
}

is_arg_present() {
  [ "x$1" != "x" ]
}
is_in_x() {
  is_arg_present "$DISPLAY"
}
is_in_tmux() {
  is_arg_present "$TMUX"
}

# kills anyone who is using the given port
#   github.com/kevinSuttle/dotfiles/commit/9458141f40094d96952adc7c423cbdddeb909a81#commitcomment-4953601
free_port() {
  if ! is_arg_present "$1"; then
    echo "Usage: free_port [numeric port identifier]" >&2
    return 1
  fi
  lsof -i TCP:$1 | awk '/LISTEN/{print $2}' | xargs kill -9
}
