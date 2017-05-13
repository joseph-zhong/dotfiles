[1;33mdiff --git a/.bash_profile b/.bash_profile[m
[1;33mindex 07f1005..e83c800 100755[m
[1;33m--- a/.bash_profile[m
[1;33m+++ b/.bash_profile[m
[1;35m@@ -16,7 +16,7 @@[m [mexport PATH=/usr/local/bin:$PATH[m
 [m
 # CUDA [m
 export CUDA_HOME=/usr/local/cuda[m
[1;31m-export DYLD_LIBRARY_PATH="/usr/local/cuda/lib":$DYLD_LIBRARY_PATH[m
[1;32m+[m[1;32mexport DYLD_LIBRARY_PATH="/usr/local/cuda/lib64":$DYLD_LIBRARY_PATH[m
 export LD_LIBRARY_PATH=$DYLD_LIBRARY_PATH[m
 export PATH=$DYLD_LIBRARY_PATH:$PATH[m
 export PATH=/usr/local/cuda/bin:$PATH[m
[1;33mdiff --git a/.bashrc b/.bashrc[m
[1;33mindex 652a922..c6a1a80 100755[m
[1;33m--- a/.bashrc[m
[1;33m+++ b/.bashrc[m
[1;35m@@ -7,7 +7,6 @@[m [mif [[ "$unamestr" == 'Linux' ]]; then[m
 fi[m
 [m
 if [[ $platform != 'linux' ]]; then [m
[1;31m- [m
   if [ -f $(brew --prefix)/etc/bash_completion ]; then[m
       . $(brew --prefix)/etc/bash_completion[m
   fi[m
[1;35m@@ -154,3 +153,7 @@[m [mcl() {[m
 }[m
 export NVM_DIR="/home/josephz/.nvm"[m
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm[m
[1;32m+[m
[1;32m+[m[1;32m# Torch install.[m
[1;32m+[m[1;32m. /home/josephz/torch/install/bin/torch-activate[m
[1;32m+[m[1;32mPATH="~/ws/git/src/bin:$PATH"[m
[1;33mdiff --git a/.vim_runtime/.vim_runtime b/.vim_runtime/.vim_runtime[m
[1;33mindex d6bb198..74eb2ee 120000[m
[1;33m--- a/.vim_runtime/.vim_runtime[m
[1;33m+++ b/.vim_runtime/.vim_runtime[m
[1;35m@@ -1 +1 @@[m
[1;31m-/homes/iws/josephz/dotfiles/.vim_runtime[m
\ No newline at end of file[m
[1;32m+[m[1;32m/home/josephz/dotfiles/.vim_runtime[m
\ No newline at end of file[m
[1;33mdiff --git a/.vimrc b/.vimrc[m
[1;33mindex 7b16604..e1e836c 100755[m
[1;33m--- a/.vimrc[m
[1;33m+++ b/.vimrc[m
[1;35m@@ -4,8 +4,4 @@[m [msource ~/.vim_runtime/vimrcs/basic.vim[m
 source ~/.vim_runtime/vimrcs/filetypes.vim[m
 source ~/.vim_runtime/vimrcs/plugins_config.vim[m
 source ~/.vim_runtime/vimrcs/extended.vim[m
[1;31m-[m
[1;31m-try[m
 source ~/.vim_runtime/my_configs.vim[m
[1;31m-catch[m
[1;31m-endtry[m
