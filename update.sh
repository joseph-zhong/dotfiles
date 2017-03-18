#!/bin/bash
#
# update.sh
# 
# Script to automatically set symblinks for each dotfile found 


DOTFILES=~/.dotfiles
FILES="$DOTFILES"/.*

for dotfile in "$FILES"
do
    if [ "$dotfile" != $DOTFILES"/." -a "$dotfile" != $DOTFILES"/.." ]; then
        echo $dotfile
    fi 
done
