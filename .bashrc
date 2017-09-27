# bashrc

####
# Git Prompt.
####
source ~/.bash_git
export GIT_PS1_SHOWDIRTYSTATE=1

# If not running interactively, don't do anything.
[ -z "$PS1" ] && return

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

# Get repo info
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00;34m\]\w\[\033[00m\]$(__git_ps1 " \[\033[01;92m\][%s]")\[\033[00m\]\$ '
    PS2="> "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


####
# Aliases
####
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -alCF'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


####
# Bash completion 
####
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
if [[ `uname` == 'Darwin' ]]; then 
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
  fi
fi


#####
# Variables
####

# History
export HISTSIZE=10000
export HISTFILESIZE=10000
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s checkwinsize

# Loads NVM
export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  

# Torch install.
if [ -d ~/torch ]; then 
  source ~/torch/install/bin/torch-activate
fi

# CUDA 
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="/usr/local/cuda/lib64":$DYLD_LIBRARY_PATH
export LD_LIBRARY_PATH=$DYLD_LIBRARY_PATH
export PATH=$DYLD_LIBRARY_PATH:$PATH
export PATH=/usr/local/cuda/bin:$PATH

# MySQL
export PATH=$PATH:/usr/local/mysql/bin

# Caffe
export PYTHONPATH=$HOME/caffe/python:$PYTHONPATH

# Local Bin
export PATH="$PATH:~/.local/bin"

# SRIO
if [[ `uname` == 'Linux' ]]; then
  WSD=~/ws
else
  WSD=~/Development/Work/Surround/ws
fi
PATH=$WSD/git/src/bin:$PATH

# Development Directories
MLD=$WSD/git/src/common/ml/pymod/surroundio/ml
MD=$WSD/git/src/common/ml/pymod/surroundio/ml/model
DD=$WSD/git/src/common/ml/pymod/surroundio/ml/data
TBD=$WSD/var/shared/shared/data/ml/tb

# School Related Directories
PAPERS=~/Papers
DOTFILES=~/dotfiles
CSE473=/cse/web/courses/cse473/17au

