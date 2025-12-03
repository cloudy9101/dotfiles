alias vi='nvim'
alias dot='cd $HOME/Projects/dotfiles'
alias crt='cd $(git rev-parse --show-toplevel)'

alias lg='lazygit'
alias ks='k9s'

# yazi file manager - change directory when quit
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
