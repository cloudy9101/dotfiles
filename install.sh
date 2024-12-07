#!/bin/bash

# Install Homebrew if not exists
if [ ! -f /opt/homebrew/bin/brew ]; then
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi
brew update
brew install zellij neovim starship asdf fzf ripgrep fd bat git-delta jq chafa
brew install --cask arc alacritty

# Link config files
ln -s $HOME/.dotfiles/config/zsh/zshenv $HOME/.zshenv
ln -s $HOME/.dotfiles/config/zsh $XDG_CONFIG_HOME/zsh
source $HOME/.zshenv

ln -s $HOME/.dotfiles/config/git/gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/config/git/gitignore $HOME/.gitignore
ln -s $HOME/.dotfiles/config/asdf/asdfrc $HOME/.asdfrc
ln -s $HOME/.dotfiles/config/asdf/tool-versions $HOME/.tool-versions
ln -s $HOME/.dotfiles/config/ $HOME/.tool-versions

ln -s $HOME/.dotfiles/config/alacritty/ $XDG_CONFIG_HOME/alacritty
ln -s $HOME/.dotfiles/config/zellij/ $XDG_CONFIG_HOME/zellij
