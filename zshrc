# Path to your oh-my-zsh installation.
export ZSH=/Users/cloudy/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="bullet-train"
### Theme custom settings begin
BULLETTRAIN_PROMPT_ORDER=(
  time
  status
  ruby
  dir
  git
  cmd_exec_time
)
BULLETTRAIN_PROMPT_CHAR=⚡️
BULLETTRAIN_DIR_FG=black
BULLETTRAIN_DIR_EXTENDED=2
BULLETTRAIN_RUBY_BG="red"
BULLETTRAIN_RUBY_FG="black"
BULLETTRAIN_RUBY_PREFIX="💎"
BULLETTRAIN_GIT_DIRTY=" %F{red}✘ %F{black}"
BULLETTRAIN_GIT_ADDED="%F{black}✚%F{black}"
BULLETTRAIN_GIT_MODIFIED="%F{black}✹%F{black}"
BULLETTRAIN_GIT_DELETED="%F{black}✖%F{black}"
BULLETTRAIN_GIT_UNTRACKED="%F{black}✭%F{black}"
### Theme custom settings end

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z git ruby bundler osx rake zsh-autosuggestions jsontools)

# User configuration

export PATH="./:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"

export TERM="xterm-256color"

export TERMINAL_NOTIFIER_BIN=/usr/local/bin/terminal-notifier

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## git up
alias gu='git up'
## capistrano
alias cpp='cap production deploy'
alias cpl='cap production logs:tail\[production\]'
alias gcpp='gu;gp;cpp'
## tmux
alias tks='tmux kill-session -t'
alias tls='tmux ls'
alias tas='tmux attach -t'
# alias end

# rbenv init
eval "$(rbenv init -)"

# fzf settings
if [ -f ~/.fzf.zsh ]; then
  export FZF_DEFAULT_OPTS="-x"
  export FZF_DEFAULT_COMMAND="ag -l -g ''"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

export ANDROID_HOME=/Users/cloudy/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH

# Golang path
export PATH=/usr/local/go/bin:$PATH
export GOPATH=$HOME/Projects/gopath

# Kubectl
source <(kubectl completion zsh)
echo 'alias k=kubectl' >>~/.zshrc
echo 'complete -F __start_kubectl k' >>~/.zshrc
alias k=kubectl
complete -F __start_kubectl k
alias k=kubectl
complete -F __start_kubectl k
alias k=kubectl
complete -F __start_kubectl k
