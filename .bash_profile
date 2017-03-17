. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\u@\h:\w (\[\e[32m\]${__git_ps1_branch_name}\[\e[0m\])\$ '
