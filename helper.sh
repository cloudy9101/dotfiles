#!/bin/sh

detect_os() {
  case "$(uname -s)" in
    Darwin) echo "darwin" ;;
    Linux) echo "linux" ;;
    *) echo "unknown" ;;
  esac
}

link_config_files() {
  echo "Link config files/folders"

  echo "export ZDOTDIR=$HOME/.config/zsh" > $HOME/.zshenv
  mkdir -p $HOME/.config

  for f in ghostty mise nvim zsh git starship.toml; do
    if ! test -e $HOME/.config/${f}; then
      ln -s $(pwd)/config/${f} $HOME/.config/${f}
    fi
  done

  ln -s $(pwd)/config/git/config $HOME/.config/.gitconfig
}
