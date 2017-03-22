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
# zplug load

export TERM=xterm-256color
# unique path
typeset -U path PATH
typeset -U fpath FPATH

# history search by peco
peco-select-history() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# anyenv
if [ -d $HOME/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init - zsh)"
fi

#
# github
#
eval "$(hub alias -s)"

#
# gcd
#
function c() {
  local dirs lc dir
  dirs=$(ghq list -p)
  # ghqのlistはignore caseのオプションがなさそうなので
  [[ -z $1 ]] || dirs=$(echo $dirs | grep -i $1)
  lc=$(echo $dirs | wc -l | tr -d '[[:space:]]')
  if [[ $lc == '1' ]] ; then
    cd ${dirs}
  else
    dir=$(echo $dirs | peco)
    [[ -z $dir ]] || cd $dir
  fi
}

#
# si
#
show_open_issues_on_web() {
  ghi show -w $(ghi list --filter 'all'| peco)
}
alias si=show_open_issues_on_web

#
# golang
#
export GOPATH=$HOME/.go
export GOENVHOME=$HOME/.goenvs
export PATH=$PATH:$GOPATH/bin

# rust
export PATH=$PATH:$HOME/.cargo/bin

#
# gem
#
export BUNDLER_EDITOR=atom

#
# tmux
#
alias ta='tmux a -t $(tmux ls -F "#S" | peco)'

#
# secrets
#
source $HOME/.secrets

#
# local bin
#
export PATH=$PATH:$HOME/bin

#
# dotnet
#
export PATH=/usr/local/share/dotnet:$PATH

# nvim
export XDG_CONFIG_HOME=$HOME/.config

function peco-find-file() {
    if git rev-parse 2> /dev/null; then
        source_files=$(git ls-files)
    else
        source_files=$(find . -type f)
    fi
    selected_files=$(echo $source_files | peco --prompt "[find file]")

    BUFFER="${BUFFER}${echo $selected_files | tr "\n" ' '}"
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N peco-find-file
bindkey '^q' peco-find-file

# vim
export EDITOR=vim

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
