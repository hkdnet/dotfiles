#!/usr/local/bin/fish

# anyenv
if [ -d $HOME/.anyenv ]
  set -x PATH $HOME/.anyenv/bin $PATH
  status --is-interactive; and source (anyenv init - fish|psub)
end

# direnv
if [ -x "(which direnv)" ]
  source (direnv hook fish)
end

# snap
if [ -d /snap/bin ]
  set -x PATH /snap/bin $PATH
end

# github
hub alias -s | source


# golang
set -x GOPATH $HOME/.ghq
set -x PATH $PATH $GOPATH/bin
set -x GO111MODULES on


# rust
set -x PATH $PATH $HOME/.cargo/bin

# alias ta='tmux a -t $(tmux ls -F "#S" | peco)'

# secrets
if [ -e ~/.secrets.fish ]
  source $HOME/.secrets.fish
end

# local bin
set -x PATH $PATH $HOME/bin

# dotnet
set -x PATH $PATH /usr/local/share/dotnet

# haskell
if [ -d ~/Library/Haskell/bin ]
  set -x PATH $PATH ~/Library/Haskell/bin
end

# for opam
# if [ -r ~/.opam/opam-init/init.fish ]
#   source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null || true
# end

# for merlin
set -x OCAMLPARAM "_,bin-annot=1"
set -x OPAMKEEPBUILDDIR 1

# for deno
if [ -d "$HOME/.deno" ]
  set -x PATH "$HOME/.deno/bin" $PATH
end

# llvm
if [ -x brew ]
  if brew --prefix llvm 2>&1 1>/dev/null
    set -x PATH "(brew --prefix llvm)/bin" $PATH
  end
end

# editor
set -x VISUAL vim
set -x EDITOR vim
set -x BUNDLER_EDITOR vim

alias vi vim

function fish_user_key_bindings
  bind \cr peco_select_history
  bind \c] peco_select_ghq_repository
end

function peco_select_ghq_repository
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  ghq list -p | peco $peco_flags | read line

  if [ $line ]
    cd $line
    commandline -f repaint
  end
end

function peco
  command peco --layout=bottom-up $argv
end

function fish_prompt
  if [ $status -eq 0 ]
    set prompt (set_color green white)" | >< '>  "
  else
    set prompt (set_color red white)" | >< x>  "
  end

  echo (set_color yellow)(prompt_pwd)$prompt
end
