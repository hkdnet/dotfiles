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
  cd $(ghq list -p | peco)
}

#
# golang
#
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

#
# gem
#
export BUNDLER_EDITOR=atom

#
# secrets
#
source $HOME/.secrets
