# bashrc

### 
# Temporary
###
# export BASH_SILENCE_DEPRECATION_WARNING=1

####
# Git Prompt.
####
source ~/.bash_git
export GIT_PS1_SHOWDIRTYSTATE=1

# hg.
function parse_hg_dirty {
  [[ $( hg status 2> /dev/null ) != "" ]] && echo "*" 
}
function parse_hg_branch {
  [[ $( hg status 2> /dev/null ) != "" ]] && \
      hg bookmark | grep '*' | cut -d ' ' -f3 2> /dev/null | sed -e "s/\(.*\)/[\1$(parse_hg_dirty)]/"
}

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00;34m\]\w\[\033[00m\]$(parse_hg_branch)$(__git_ps1 " \[\033[01;92m\][%s]")\[\033[00m\]\$ '
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

##
# fzf completion
##
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#####
# Variables
#####

#### Path
# Private Path
if [[ -d ~/.private_aliases/bin/ ]]; then
  export PATH=$HOME/.private_aliases/bin:$PATH
fi


# Python
if [[ `uname` == 'Darwin' ]]; then
  export PATH=/Users/josephz/Library/Python/2.7/bin:$PATH
  export PATH=/usr/local/bin:/usr/local/sbin:$PATH
fi

# CTRL-Labs
export WS_PATH=$HOME/work
export PATH=$HOME/bin:$PATH
export PATH=$WS_PATH/ctrl-service/bin:$PATH
export MPLBACKEND=AGG

# SRIO
DEVD=~/Development
if [[ `uname` == 'Linux' ]]; then
  WSD=~/ws
else
  WSD=$DEVD/Work/Xevo/ws
fi
export PATH=$WSD/git/src/bin:$PATH
export PYTHONPATH="${PYTHONPATH}:$WSD/git/ml/framework/pymod"
export PYTHONPATH="${PYTHONPATH}:$WSD/git/ml/personal/jzhong/experiments/2018/py/ml/computer_vision_utils"

# Brew
if [[ `uname` == 'Darwin' ]]; then
  export PATH="/usr/local/opt/gettext/bin:$PATH"
fi

# Development Directories
export DOTFILES=~/dotfiles
export DROPBOX=~/Dropbox
export GOOGLE_DRIVE=~/GoogleDrive
export PAPERS=$GOOGLE_DRIVE/Papers
export UNIVERSITY=$GOOGLE_DRIVE/University
export UW_DIR=$UNIVERSITY/UW
export SCHOOL=$UW_DIR/2018-19 

### CSE.
if [[ `hostname` == *'.cs.washington.edu' ]]; then
  CSE=/cse/web/
  JOSEPHZ=$CSE/homes/josephz
fi 
export DRL_DIR=$UW_DIR/CSE599G1/hw/drl_hw1
export PYTHONPATH="$DRL_DIR:$PYTHONPATH"

### Misc Projects.
export PYTHONPATH="~/GoogleDrive/University/UW/2018-19/CSE481I/singing-style-transfer:$PYTHONPATH" 
export PYTHONPATH="~/ws/git/VideoSummarization:$PYTHONPATH"

### GRAIL.
hname=$(hostname | cut -d "." -f1)
if grep -Fxq $hname ~/.grail_hosts.txt
then
  GRAIL=~/GRAIL
  IM1=$GRAIL/InteractiveModel
  IM2=$GRAIL/InteractiveModelnb
else
  GRAIL=$DEVD/UW/GRAIL
  IM1=$GRAIL/InteractiveModel
  IM2=$GRAIL/InteractiveModelnb
fi
export IM_DIR=$IM1
export IM2_DIR=$IM2
export IM_DIR_TF_VERSION1=tf-0.10.0
export IM_DIR_TF_VERSION2=tf-0.11.0
export IM_DIR_TF_VERSION3=tf-1.3.0
export IM_DIR_TF_VERSION4=tf-1.4.0
export IM_DIR_VIRTUALENV1=${IM_DIR}/infra/virtualenv/${IM_DIR_TF_VERSION1}
export IM_DIR_VIRTUALENV2=${IM_DIR}/infra/virtualenv/${IM_DIR_TF_VERSION2}
export IM_DIR_VIRTUALENV3=${IM_DIR}/infra/virtualenv/${IM_DIR_TF_VERSION3}
export IM_DIR_VIRTUALENV4=${IM_DIR}/infra/virtualenv/${IM_DIR_TF_VERSION4}
export WORKON_HOME=$IM1/infra/virtualenv
export PYTHONPATH="${PYTHONPATH}:${IM1}"
export PATH="${PATH}:$IM_DIR/archive/bin"
export PATH="${PATH}:$IM_DIR/src/bin2"

# ROS
if [[ -f /opt/ros/kinetic/setup.bash ]]; then
  export ROS=/home/josephz/catkin_ws
  export ROS_PACKAGE_PATH
  export ROS_MASTER_URI=http://localhost:11311
  export PYTHONPATH=$PYTHONPATH:~/Dropbox/UW/CSE490R/labs/src/lab3/src
  # export ROS_MASTER_URI=http://10.42.0.1:11311
  # export ROS_IP=10.42.0.196
  
  source /opt/ros/kinetic/setup.bash
  source $ROS/devel/setup.bash 
fi

# History
# Use prompt command to log all bash to files in .logs
mkdir -p ~/.logs/
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(history 1)" >> ~/.logs/bash-history-${myhostname}-$(date "+%Y-%m-%d").log; fi'
alias fullhistory="cat ~/.logs/* | grep '^20' | sort"
hist() {
    fullhistory | grep_and $@ | tail -n 30
}

export HISTSIZE=10000
export HISTFILESIZE=10000
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s checkwinsize

# Loads NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Yarn
export PATH="$HOME/.yarn/bin:$PATH"

# Torch install.
if [ -f  ~/torch/install/bin/torch-activate ]; then 
  export PATH="~/torch/install/bin:$PATH"
  source ~/torch/install/bin/torch-activate
fi

# CUDA 
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_HOME/lib64:$CUDA_HOME/extras/CUPTI/lib64
export PATH=$DYLD_LIBRARY_PATH:$PATH
export PATH=$CUDA_HOME/bin:$PATH

# Intel
export PATH=/opt/intel/bin:$PATH

# add MKL and the compiler libs to the path
export LD_LIBRARY_PATH=/opt/intel/mkl/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/intel/lib/:$LD_LIBRARY_PATH

# MySQL
export PATH=$PATH:/usr/local/mysql/bin

# Caffe
export PYTHONPATH=$HOME/caffe/python:$PYTHONPATH

# OpenPose 
export OPENPOSE_ROOT=/usr/local/openpose 
export LD_LIBRARY_PATH=$OPENPOSE_ROOT/build/src/openpose:$LD_LIBRARY_PATH
export PATH=$OPENPOSE_ROOT/build/examples/openpose:$PATH

### PyOpenPose Python Wrapper
# export PYTHONPATH=/usr/local/openpose/build/src/openpose:$PYTHONPATH
export PYTHONPATH=/usr/local/PyOpenPose/build/PyOpenPoseLib:$PYTHONPATH
# export PYTHONPATH=$OPENPOSE_ROOT:$PYTHONPATH

# MuJoCo
export LD_LIBRARY_PATH="$HOME/.mujoco/mjpro150/bin:$LD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$HOME/.mujoco/mjpro150/bin

# Local Bin
export PATH="$PATH:~/.local/bin"
export PATH=$HOME/local/bin:$PATH

###
# GCloud
###
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/josephz/Downloads/gcloud/google-cloud-sdk/path.bash.inc' ]; then . '/Users/josephz/Downloads/gcloud/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/josephz/Downloads/gcloud/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/josephz/Downloads/gcloud/google-cloud-sdk/completion.bash.inc'; fi

# Xpra
export PATH="$PATH:/usr/lib/xorg"

###
# Keras
###

# Keras Backend.
KERAS_BACKEND=theano 
export CPATH=$CPATH:~/.local/include
export LIBRARY_PATH=$LIBRARY_PATH:~/.local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.local/lib

# Anaconda 3
export PATH=~/anaconda3/bin:$PATH
export PATH=~/miniconda3/bin:$PATH

###
# PEM
###
export PEM_DIR=$DEVD/pem
function scp-via-pem() {
  pem=$1
  src=$2
  dst=$3
  cmd="scp -i $pem -r $src $dst"
  echo "Running $cmd..."
  $cmd
}

####
# Aliases
####
alias ls="ls -Gh"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -alCF'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
