#!/bin/bash

#update .vimrc
rm ~/.vimrc
cp .vimrc ~/

#update gitconfig
rm ~/.gitconfig
cp .gitconfig ~/

#update bashprofile
rm ~/.bash_profile
cp .bash_profile ~/
source ~/.bash_profile #reload bash_profile

#update gitconfig
rm ~/.tmux.conf
cp .tmux.conf ~/
tmux source-file ~/.tmux.conf #reload tmux config
