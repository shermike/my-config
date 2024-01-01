#!/bin/bash

CFG_DIR=$(realpath `dirname -- "$0"`)

cd $CFG_DIR

cp $CFG_DIR/.bashrc.mike $CFG_DIR/.gdbinit $CFG_DIR/.gitconfig .tmux.conf .vimrc ~/
cp -r $CFG_DIR/.config/krusaderrc $CFG_DIR/.config/mc ~/.config/
mkdir -p ~/scripts
cp tmux.sh ~/scripts/
chmod +x ~/scripts/tmux.sh
#tar -xzf .tmux.tar.gz ~/