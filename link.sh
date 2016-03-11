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
)
for file in ${files[@]}; do
  ln -sf ${script_dir}/${file} ~/${file}
done
