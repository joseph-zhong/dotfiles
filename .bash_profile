export PATH=$PATH:/Users/Joseph/Library/Android/sdk/platform-tools/
export PATH="$PATH:$HOME/bin"
export PATH=/usr/local/bin:$PATH

export HISTSIZE=10000
export HISTFILESIZE=10000

alias ll='ls -alF'
alias l='ls -alF'

. ~/git-prompt.sh
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\u@\h:\w (\[\e[32m\]${__git_ps1_branch_name}\[\e[0m\])\$ '
