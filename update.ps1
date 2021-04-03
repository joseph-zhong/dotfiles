# 
# update.ps1
#
# 	Script to automatically set symbllinks for each dotfile (Windows)
#
# Run powershell_configs/make_symblink.ps1 first.

# vimrc.
git clone https://github.com/joseph-zhong/vimrc.git ../.vim_runtime
powershell ../.vim_runtime/install_awesome_vimrc.ps1

write-output "creating symblink for my_configs.vim\n"
symblink ~/dotfiles/my_configs.vim ~/.vim_runtime/

# printf 'installing fzf...\n'
# .fzf/install

# echo
# echo "Done updating dotfiles... Please run \`source .bashrc\`"
# echo

# Install posh-git
PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
