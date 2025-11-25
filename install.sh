#!/bin/sh

echo "Start install.sh"

echo "PWD: $(pwd)"

echo "Install dependencies"
xcode-select --install
brew bundle check --file ./config/Brewfile || brew bundle install --file ./config/Brewfile

echo "Link config files/folders"
for f in ghostty mise nvim zsh git starship.toml; do
  if ! test -e $HOME/.config/${f}; then
    ln -s $(pwd)/config/${f} $HOME/.config/${f}
  fi
done

echo "Install ohmyzsh"
echo "export ZDOTDIR=$HOME/.config/zsh" > $HOME/.zshenv
export ZDOTDIR=$HOME/.config/zsh
echo "export XTERM=xterm-256color" >>$HOME/.zshenv
export KEEP_ZSHRC=yes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "Install ohmyzsh plugins"
export ZSH_CUSTOM=$ZDOTDIR/ohmyzsh-custom
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/wintermi/zsh-mise ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-mise
