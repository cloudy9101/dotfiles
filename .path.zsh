# /usr/local/bin
export PATH=$PATH:/usr/local/bin:$HOME/.cache/bin:$HOME/.fzf/bin

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # asdf
  . "$HOME/.asdf/asdf.sh"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Homebrew
  [[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

  # asdf
  . $(brew --prefix asdf)/libexec/asdf.sh
fi

if [ -f $HOME/.asdf/plugins/golang/set-env.zsh ]; then
  # set GOROOT
  . $HOME/.asdf/plugins/golang/set-env.zsh
fi
