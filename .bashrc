# bashrc

###
# Temporary
###
# Supress bash deprecation warning: https://support.apple.com/en-us/HT208050
export BASH_SILENCE_DEPRECATION_WARNING=1
export DATE=$(date '+%Y-%m-%d')
# export RESTAPI_SERVICE=http://localhost:3000

# Make sure brew works without sudo
# sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/sbin
# chmod u+w /usr/local/bin /usr/local/lib /usr/local/sbin



####
# Git Prompt.
####
source ~/.bash_git
export GIT_PS1_SHOWDIRTYSTATE=1

# hg.
_find_most_relevant() {
    # We don't want to output all remote bookmarks because there can be many
    # of them. This function finds the most relevant remote bookmark using this
    # algorithm:
    # 1. If 'master' or '@' bookmark is available then output it
    # 2. Sort remote bookmarks and output the first in reverse sorted order (
    # it's a heuristic that tries to find the newest bookmark. It will work well
    # with bookmarks like 'release20160926' and 'release20161010').
    relevantbook="$(command grep -m1 -E -o "^[^/]+/(master|@)$" <<< "$1")"
    if [[ -n $relevantbook ]]; then
        builtin echo $relevantbook
        return 0
    fi

    builtin echo "$(command sort -r <<< "$1" | command head -n 1)"
}


_git_dirty() {
  # cf. git contrib/completion/git-prompt.sh
  if [ -n "${SHOW_DIRTY_STATE}" ] &&
     [ "$(git config --bool shell.showDirtyState)" != "false" ]; then
       command git diff --no-ext-diff --quiet || w="*"
       command git diff --no-ext-diff --cached --quiet || i="+"
       builtin printf "%s" "$w$i"
  fi
}

_git_prompt() {
  local git br
  git="$1"
  if [[ -f "$git" ]]; then
      git=$(awk '/^gitdir:/ {print $2}' < "$git")
  fi
  if [[ -f "$git/HEAD" ]]; then
    read br < "$git/HEAD"
    case $br in
      ref:\ refs/heads/*) br=${br#ref: refs/heads/} ;;
      *) br="$(builtin echo "$br" | command cut -c 1-8)" ;;
    esac
    if [[ -f "$git/rebase-merge/interactive" ]]; then
      b="$(command cat "$git/rebase-merge/head-name")"
      b="${b#refs/heads/}"
      br="$br|REBASE-i|$b"
    elif [[ -d "$git/rebase-merge" ]]; then
      b="$(command cat "$git/rebase-merge/head-name")"
      b="${b#refs/heads/}"
      br="$br|REBASE-m|$b"
    else
      if [[ -d "$git/rebase-apply" ]]; then
        if [[ -f "$git/rebase-apply/rebasing" ]]; then
          b="$(command cat "$git/rebase-apply/head-name")"
          b="${b#refs/heads/}"
          br="$br|REBASE|$b"
        elif [[ -f "$git/rebase-apply/applying" ]]; then
          br="$br|AM"
        else
          br="$br|AM/REBASE"
        fi
      elif [[ -f "$git/CHERRY_PICK_HEAD" ]]; then
        br="$br|CHERRY-PICKING"
      elif [[ -f "$git/REVERT_HEAD" ]]; then
        br="$br|REVERTING"
      elif [[ -f "$git/MERGE_HEAD" ]]; then
        br="$br|MERGE"
      elif [[ -f "$git/BISECT_LOG" ]]; then
        br="$br|BISECT"
      fi
    fi
  fi
  br="$br$(_git_dirty)"
  builtin printf "%s" "$br"
}

_hg_prompt() {
  local hg br extra
  hg="$1"

  if [[ -f "$hg/bisect.state" ]]; then
    extra="|BISECT"
  elif [[ -f "$hg/histedit-state" ]]; then
    extra="|HISTEDIT"
  elif [[ -f "$hg/graftstate" ]]; then
    extra="|GRAFT"
  elif [[ -f "$hg/unshelverebasestate" ]]; then
    extra="|UNSHELVE"
  elif [[ -f "$hg/rebasestate" ]]; then
    extra="|REBASE"
  elif [[ -d "$hg/merge" ]]; then
    extra="|MERGE"
  elif [[ -L "$hg/store/lock" ]]; then
    extra="|STORE-LOCKED"
  elif [[ -L "$hg/wlock" ]]; then
    extra="|WDIR-LOCKED"
  fi

  local dirstate="$( \
    ( [[ -f "$hg/dirstate" ]] && \
    command hexdump -vn 20 -e '1/1 "%02x"' "$hg/dirstate") || \
    builtin echo "")"

  local shared_hg="$hg"
  if [[ -f "$hg/sharedpath" ]]; then
    shared_hg="$(command cat $hg/sharedpath)"
  fi
  local remote="$shared_hg/store/remotenames"

  local active="$hg/bookmarks.current"
  if  [[ -f "$active" ]]; then
    br="$(command cat "$active")"
    # check to see if active bookmark needs update (eg, moved after pull)
    local marks="$shared_hg/store/bookmarks"
    if [[ -z "$extra" ]] && [[ -f "$marks" ]]; then
      local markstate="$(command grep " $br$" "$marks" | \
        command cut -f 1 -d ' ')"
      if [[ $markstate != "$dirstate" ]]; then
        extra="|UPDATE_NEEDED"
      fi
    fi
  else
    br="$(builtin echo "$dirstate" | command cut -c 1-9)"
  fi
  if [[ -f "$remote" ]]; then
    local allremotemarks="$(command grep "^$dirstate bookmarks" "$remote" | \
      command cut -f 3 -d ' ')"

    if [[ -n "$allremotemarks" ]]; then
        local remotemark="$(_find_most_relevant "$allremotemarks")"
        if [[ -n "$remotemark" ]]; then
          br="$br|$remotemark"
          if [[ "$remotemark" != "$allremotemarks" ]]; then
            # if there is more than one, let the user know with an elipsis
            br="${br}..."
          fi
        fi
    fi
  fi
  local branch
  if [[ -f "$hg/branch" ]]; then
    branch="$(command cat "$hg/branch")"
    if [[ "$branch" != "default" ]]; then
      br="$br|$branch"
    fi
  fi
  br="$br$extra$(_hg_dirty)"
  builtin printf "%s" "$br"
}

# cf. https://www.internalfb.com/intern/qa/4964/how-do-i-show-the-mercurial-bookmarkgit-branch-in?answerID=540621130023036
_hg_dirty() {
  if [ -n "${SHOW_DIRTY_STATE}" ] &&
     [ "$(hg config shell.showDirtyState)" != "false" ]; then
    command hg status 2> /dev/null \
    | command awk '$1 == "?" { print "?" } $1 != "?" { print "*" }' \
    | command sort | command uniq | command head -c1
  fi
}

_scm_prompt() {
  local dir fmt br
  # Default to be compatable with __git_ps1. In particular:
  # - provide a space for the user so that they don't have to have
  #   random extra spaces in their prompt when not in a repo
  fmt="${1:- (%s)}"

  # find out if we're in a git or hg repo by looking for the control dir
  dir="$PWD"
  while : ; do
    [[ -n "$HOME_IS_NOT_A_REPO" ]] && [[ "$dir" = "/home" ]] && break
    if [[ -r "$dir/.git" ]]; then
      br="$(_git_prompt "$dir/.git")"
      # br="$(__git_ps1)"
      break
    elif [[ -d "$dir/.hg" ]]; then
      br="$(_hg_prompt "$dir/.hg")"
      break
    fi
    [[ "$dir" = "/" ]] && break
    # portable "realpath" equivalent
    dir="$(builtin cd -P "$dir/.." && builtin echo "$PWD")"
  done

  if [[ -n "$br" ]]; then
    builtin printf "$fmt" "$br"
  fi
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
    # TODO: Make this way easier to read for future developer :(
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00;34m\]\w\[\033[00m\]$(_scm_prompt " \[\033[01;92m\][%s]")\[\033[00m\]\$ '
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

# Go
export PATH=$HOME/go/bin:$PATH

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
export GOOGLE_DRIVE=/Volumes/GoogleDrive
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
export PATH=$CUDA_HOME/bin:$PATH

# Intel
export PATH=/opt/intel/bin:$PATH

# MySQL
export PATH=$PATH:/usr/local/mysql/bin

# Caffe
export PYTHONPATH=$HOME/caffe/python:$PYTHONPATH

# OpenPose
export OPENPOSE_ROOT=/usr/local/openpose
export PATH=$OPENPOSE_ROOT/build/examples/openpose:$PATH

### PyOpenPose Python Wrapper
# export PYTHONPATH=/usr/local/openpose/build/src/openpose:$PYTHONPATH
export PYTHONPATH=/usr/local/PyOpenPose/build/PyOpenPoseLib:$PYTHONPATH
# export PYTHONPATH=$OPENPOSE_ROOT:$PYTHONPATH

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

# Anaconda 3
export PATH=~/anaconda3/bin:$PATH
export PATH=~/miniconda3/bin:$PATH

# Kubectl
# source <(kubectl completion bash)
# alias k=kubectl
# complete -F __start_kubectl k

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


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/josephz/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/josephz/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/josephz/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/josephz/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


ALL_PROXY=fwdproxy:8080
eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa
