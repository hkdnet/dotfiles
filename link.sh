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

mkdir -p ~/.config

dotconfigdirs=$(ls .config)
for dir in $dotconfigdirs; do
  rm -rf ~/.config/$dir
  ln -sf ${script_dir}/.config/${dir} ~/.config/${dir}
done
