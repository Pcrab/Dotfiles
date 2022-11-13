#!/usr/bin/env bash
git clone --bare https://github.com/Pcrab/dotfiles $HOME/.cfg
alias cfg='git --git-dir=$HOME/.cfg --work-tree=$HOME'
cfg config --local status.showUntrackedFiles no
cfg checkout
