# Homebrew
[[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
. $(brew --prefix asdf)/libexec/asdf.sh
. $HOME/.asdf/plugins/golang/set-env.zsh
