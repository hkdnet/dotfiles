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
  eval "$(anyenv init -)"
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
# golang
#
export GOPATH=$HOME/.go
export GOENVHOME=$HOME/.goenvs
export PATH=$PATH:$GOPATH/bin

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
