#!/usr/bin/env bash

# git clone --bare git@github.com:Pcrab/dotfiles.git $HOME/.cfg
cfg="git --git-dir=$HOME/.cfg --work-tree=$HOME"
# cfg config --local status.showUntrackedFiles no
# cfg checkout

for filePath in $($cfg ls-files | grep ".asc$")
do
    decryptedFilePath=${filePath%.asc*}
    gpg -d $filePath > $decryptedFilePath
done
