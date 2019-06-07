#!/bin/bash
#
# update.sh
#
#   Script to automatically set symblinks for each dotfile
#
# Notes:
#   We ignore ., .., .DS_Store .gitignore  and .git -- in the future a list of
#   files to ignore should be listed in a file. If the symblink already exists,
#   we will forcefully overwrite the previous symblink and source the dotfile if
#   the dotfile contains bash in the filename
#

DOTFILES_DIR=`pwd`
DOTFILES=$DOTFILES_DIR/.*

for dotfile in $DOTFILES
do
    if [ $DOTFILES_DIR != $dotfile ] \
        && [ $DOTFILES_DIR'/.' != "$dotfile" ] \
        && [ $DOTFILES_DIR'/..' != "$dotfile" ] \
        && [ $DOTFILES_DIR'/.git' != "$dotfile" ] \
        && [ $DOTFILES_DIR'/.DS_Store' != "$dotfile" ]
    then
        printf $'creating symblink for '$dotfile$'\n'
        ln -sf $dotfile ~/$(basename $dotfile)
    else
        printf $'ignoring '$dotfile$'\n'
    fi
done

git clone https://github.com/joseph-zhong/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

printf 'creating symblink for my_configs.vim\n'
ln -sf ~/dotfiles/my_configs.vim ~/.vim_runtime/

printf 'installing fzf...\n'
cd .fzf && ./install

echo
echo "Done updating dotfiles... Please run \`source .bashrc\`"
echo

