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
)

for file in ${files[@]}; do
  ln -sf ${script_dir}/${file} ~/${file}
done

atom=(
  keymap.cson
  snippets.cson
)
mkdir -p ~/.atom
for file in ${atom[@]}; do
  ln -sf ${script_dir}/atom/${file} ~/.atom/${file}
done

mkdir -p ~/.config

dotconfigdirs=$(ls .config)
for dir  in $dotconfigdirs; do
  rm ~/.config/$dir
  ln -sf ${script_dir}/${dir} ~/.config/${dir}
done
