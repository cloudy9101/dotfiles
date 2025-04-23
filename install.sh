#!/bin/zsh

echo "Start install.sh"

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    MSYS_NT*)   machine=MSys;;
    *)          machine="UNKNOWN:${unameOut}"
esac

unameM="$(uname -m)"
case "${unameM}" in
  aarch64*) arch=arm64;;
  *)        arch=x86_64;;
esac

echo "Machine: ${machine} ${arch}"

echo "PWD: $(pwd)"

if [[ $machine == "Mac" ]]; then
  echo "Install dependencies for ruby"
  xcode-select --install
  brew install openssl@3 readline libyaml gmp autoconf

  echo "Install packages"
  brew install ghostty starship mise neovim
  brew install --cask font-cascadia-code-nf
fi

if [[ $machine == "Linux" ]]; then
  echo "Install dependencies for ruby"
  sudo apt install -y autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev

  echo "Install mise"
  curl https://mise.run | sh
  mise install

  echo "Install starship"
  curl -sS https://starship.rs/install.sh | sh -s -- -f -y -b $HOME/.local/bin

  echo "Install neovim"
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${arch}.tar.gz
  tar -C $(pwd) -xzf nvim-linux-${arch}.tar.gz
  ln -fs $(pwd)/nvim-linux-${arch}/bin/nvim $HOME/.local/bin/nvim
fi

echo "Link config files/folders"
for f in ghostty mise nvim zsh starship.toml; do
  if ! test -e $HOME/.config/${f}; then
    ln -s $(pwd)/config/${f} $HOME/.config/${f}
  fi
done

echo "Install ohmyzsh"
echo "export ZDOTDIR=$HOME/.config/zsh" > $HOME/.zshenv
echo "export XTERM=xterm-256color" >>$HOME/.zshenv
export ZDOTDIR=$HOME/.config/zsh
export KEEP_ZSHRC=yes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "Install ohmyzsh plugins"
export ZSH_CUSTOM=$ZDOTDIR/ohmyzsh-custom
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/wintermi/zsh-mise ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-mise

# Change default shell to zsh in GitHub codespaces
if [[ $CODESPACES == "true" ]]; then
  echo "Change default shell to zsh in GitHub codespaces"
  sudo chsh "$(id -un)" --shell "/usr/bin/zsh"
fi
