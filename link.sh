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
  .thymerc
)
for file in ${files[@]}; do
  ln -sf ${script_dir}/${file} ~/${file}
done

atom=(
  keymap.cson
  snippets.cson
)
for file in ${atom[@]}; do
  ln -sf ${script_dir}/atom/${file} ~/.atom/${file}
done

mkdir -p ~/.config/nvim
ln -sf ~/.vim   ~/.config/nvim/
ln -sf ~/.vimrc ~/.config/nvim/init.vim

mkdir -p ~/.config/peco
ln -sf config/peco/config.json ~/.config/peco/config.json
