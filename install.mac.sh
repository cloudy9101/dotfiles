#!/bin/sh

. ./helper.sh

echo "xcode-select install"
xcode-select --install

echo "brew install"
brew bundle check --file ./config/Brewfile || brew bundle install --file ./config/Brewfile

link_config_files

install_ohmyzsh
