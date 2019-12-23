#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export ZPLUG_HOME=$HOME/.zplug
if [ ! -d $ZPLUG_HOME ]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi
source $ZPLUG_HOME/init.zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/aws", from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh
zplug load

export TERM=xterm-256color
# unique path
typeset -U path PATH
typeset -U fpath FPATH

# direnv
if [ -x "$(which direnv)" ]; then
  eval "$(direnv hook zsh)"
fi

# anyenv
if [ -d $HOME/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init - zsh)"
fi

# github
if [ -x "$(which hub)" ]; then
  eval "$(hub alias -s)"
fi

# golang
export GOPATH=$HOME/.ghq
export PATH=$PATH:$GOPATH/bin
export GO111MODULES=on

# rust
export PATH=$PATH:$HOME/.cargo/bin

# tmux
alias ta='tmux a -t $(tmux ls -F "#S" | peco)'

# secrets
if [ -e $HOME/.secrets ]; then
  source $HOME/.secrets
fi

# local bin
export PATH=$HOME/bin:$PATH

# dotnet
export PATH=/usr/local/share/dotnet:$PATH

# haskell
if [ -d ~/Library/Haskell/bin ]; then
  export PATH=$PATH:~/Library/Haskell/bin
fi
if [ -e ~/.ghcup/env ]; then
  source ~/.ghcup/env
fi


if [ -x /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
fi

# editor
export VISUAL=vim
export EDITOR=vim
export BUNDLER_EDITOR=vim

alias vi vim

# nvim
export XDG_CONFIG_HOME=$HOME/.config

# history preference
setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt HIST_BEEP
HISTFILE="$HOME/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

# history search by peco
peco-select-history() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --layout bottom-up --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N peco-select-history
bindkey '^r' peco-select-history


# gcd
function peco-select-ghq-repository() {
  local dirs lc dir
  dirs=$(ghq list -p)
  # ghqのlistはignore caseのオプションがなさそうなので
  [[ -z $1 ]] || dirs=$(echo $dirs | grep -i $1)
  lc=$(echo $dirs | wc -l | tr -d '[[:space:]]')
  if [[ $lc == '1' ]] ; then
    cd ${dirs}
  else
    dir=$(echo $dirs | peco --layout bottom-up)
    [[ -z $dir ]] || cd $dir
  fi
}
zle -N peco-select-ghq-repository
bindkey '^]' peco-select-ghq-repository

if [ -d ~/.zsh/completion ]; then
  fpath=(~/.zsh/completion $fpath)
fi
if [ -x brew ]; then
  if [ -d "$(brew --prefix)/share/zsh/site-functions" ]; then
   fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
  fi
fi
autoload -Uz compinit && compinit -i

# for opam
test -r ~/.opam/opam-init/init.zsh && . ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
# for merlin
export OCAMLPARAM="_,bin-annot=1"
export OPAMKEEPBUILDDIR=1

# for deno
if [ -d "${HOME}/.deno" ]; then
  export PATH=${HOME}/.deno/bin:$PATH
fi

# llvm
if brew --prefix llvm 2>&1 1>/dev/null ; then
  export PATH="$(brew --prefix llvm)/bin:$PATH"
fi

if [ -d "${HOME}/Library/Python/2.7/bin" ]; then
  export PATH="${HOME}/Library/Python/2.7/bin":$PATH
fi

if [ -d "${HOME}/.local/bin" ]; then
  export PATH="$PATH:${HOME}/.local/bin"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="~/.sdkman"
[[ -s "~/.sdkman/bin/sdkman-init.sh" ]] && source "~/.sdkman/bin/sdkman-init.sh"

# flutter
export PATH=$PATH:$HOME/.ghq/src/github.com/flutter/flutter/bin

# mzp
# unsetopt prompt_subst;

mzp_preexec() {
}

mzp_precmd() {
    eval $(mzp)
}

mzp_setup() {
    autoload -Uz add-zsh-hook

    add-zsh-hook precmd mzp_precmd
    add-zsh-hook preexec mzp_preexec
}

# mzp_setup
