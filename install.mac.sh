#!/bin/sh

. ./helper.sh

echo "xcode-select install"
xcode-select --install

echo "brew install"
brew bundle check --file ./config/Brewfile || brew bundle install --file ./config/Brewfile

install_aqua

install_bins

link_config_files

install_ohmyzsh
