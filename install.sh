#!/bin/bash

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  # install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  # install p10k
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

  # install zsh plugins
  git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
fi

if [ ! -d "$HOME/.cfg" ]; then
  # clone dotfiles in $HOME
  git clone --bare git@github.com:cloudy9101/dotfiles.git --branch bare "$HOME/.cfg"

  function config {
    git --git-dir="$HOME/.cfg/" --work-tree="$HOME" "$@"
  }

  echo "Checked out config.";
  config checkout
  config config status.showUntrackedFiles no
fi
