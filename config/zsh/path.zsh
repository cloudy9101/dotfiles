source $(brew --prefix asdf)/libexec/asdf.sh

if [ -f $HOME/.asdf/plugins/golang/set-env.zsh ]; then
  # set GOROOT
  export ASDF_GOLANG_MOD_VERSION_ENABLED=true
  source $HOME/.asdf/plugins/golang/set-env.zsh
fi

export PNPM_HOME="~/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="/usr/local/bin:$PATH"
