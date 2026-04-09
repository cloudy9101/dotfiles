export ZSH="$ZDOTDIR/ohmyzsh"
ZSH_THEME="robbyrussell"
ZSH_CUSTOM=$ZDOTDIR/ohmyzsh-custom

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

# MacOS specific eval
if [[ "$OSTYPE" == "darwin"* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
