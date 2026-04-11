#!/bin/sh

detect_os() {
  case "$(uname -s)" in
    Darwin) echo "darwin" ;;
    Linux) echo "linux" ;;
    *) echo "unknown" ;;
  esac
}

install_aqua() {
  curl -sSfL -O https://raw.githubusercontent.com/aquaproj/aqua-installer/v4.0.2/aqua-installer
  echo "98b883756cdd0a6807a8c7623404bfc3bc169275ad9064dc23a6e24ad398f43d  aqua-installer" | sha256sum -c -
  chmod +x aqua-installer
  ./aqua-installer
}

install_bins() {
  aqua_path=${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin
  export PATH="$PATH:$aqua_path"

  aqua i -c ./config/aqua.yaml
}

link_config_files() {
  echo "Link config files/folders"

  echo "export ZDOTDIR=$HOME/.config/zsh" > $HOME/.zshenv

  for f in aqua.yaml ghostty mise nvim zsh git starship.toml; do
    if ! test -e $HOME/.config/${f}; then
      ln -s $(pwd)/config/${f} $HOME/.config/${f}
    fi
  done

  ln -s $(pwd)/config/git/config $HOME/.config/.gitconfig
}

install_ohmyzsh() {
  echo "Install ohmyzsh"

  if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "oh-my-zsh already installed, skipping"
    return
  fi

  zdotdir=$HOME/.config/zsh

  RUNZSH=no CHSH=no ZDOTDIR=$zdotdir KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  echo "Install ohmyzsh plugins"
  export ZSH_CUSTOM=$zdotdir/ohmyzsh-custom
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}
