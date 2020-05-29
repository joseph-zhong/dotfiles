# 
# update.ps3
#
# 	Script to automatically set symbllinks for each dotfile (Windows)
#

# vimrc.
git clone https://github.com/joseph-zhong/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

printf 'creating symblink for my_configs.vim\n'
ln -sf ~/dotfiles/my_configs.vim ~/.vim_runtime/

printf 'installing fzf...\n'
cd .fzf && ./install

echo
echo "Done updating dotfiles... Please run \`source .bashrc\`"
echo

