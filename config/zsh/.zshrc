export ZSH="$ZDOTDIR/ohmyzsh"
ZSH_THEME="robbyrussell"
ZSH_CUSTOM=$ZDOTDIR/ohmyzsh-custom

# Homebrew activate
if [[ "$OSTYPE" == "darwin"* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Path
# MacOS specific path
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Include rancher-desktop bin folder (include docker, kubectl etc.)
  export PATH="$HOME/.rd/bin:$PATH"
  # Include binaries installed by bun
  export PATH="$HOME/.bun/bin:$PATH"
fi
aqua_path=${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin
export PATH="$PATH:$aqua_path"
export AQUA_GLOBAL_CONFIG=$HOME/.config/aqua.yaml

plugins=(
  aws
  gh
  git
  golang
  helm
  kubectl
  mise
  nats
  podman
  rails
  ruby
  ssh
  ssh-agent
  starship
  tldr
  zoxide
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Alias
alias vi='nvim'
alias dot='cd $HOME/Projects/dotfiles'
alias crt='cd $(git rev-parse --show-toplevel)'
alias lg='lazygit'
