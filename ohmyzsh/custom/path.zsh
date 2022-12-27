# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Golang
PATH=/usr/local/go/bin:$PATH
PATH=$HOME/Projects/gopath/bin:$PATH
export GOPATH=$HOME/Projects/gopath

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Yarn
PATH=$HOME/.yarn/bin:$PATH

# rbenv
eval "$(rbenv init - zsh)"
