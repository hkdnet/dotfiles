#!/bin/bash

set -e
script_dir=$(cd $(dirname $0); pwd)
cd $script_dir

files=(
  .gitconfig
  .gitignore
  .tmux.conf
  .zlogin
  .zlogout
  .zprofile
  .zshenv
  .zshrc
  .vimrc
  .vimrc.basic
  .vimrc.plug
  .vimrc.indent
  .vimrc.lang
)
for file in ${files[@]}; do
  ln -sf ${script_dir}/${file} ~/${file}
done

ln -s ~/.vim   ~/.config/nvim/
ln -s ~/.vimrc ~/.config/nvim/init.vim
