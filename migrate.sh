#!/usr/bin/env bash
git clone --bare git@github.com:Pcrab/dotfiles.git $HOME/.cfg
alias cfg='git --git-dir=$HOME/.cfg --work-tree=$HOME'
cfg config --local status.showUntrackedFiles no
cfg checkout
