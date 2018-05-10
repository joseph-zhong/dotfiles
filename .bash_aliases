# Bash Aliases 

####
# Standard Xevo directories
####
alias e1='pushd $WSD/git/src > /dev/null'
alias s1='pushd $WSD/git/src/common/ml/scripts > /dev/null'
alias md1='pushd $WSD/git/src/common/ml/pymod/xevo/ml/model > /dev/null'
alias dd1='pushd $WSD/git/src/common/ml/pymod/xevo/ml/data > /dev/null'

alias ja1='pushd $WSD/git/personal/josephz > /dev/null'
alias aa1='source $WSD/git/personal/josephz/openface/bin/activate'

alias tb1='pushd $WSD/var/shared/shared/data/ml/tb > /dev/null'
alias d1='pushd $WSD/var/shared/shared/data/ml/datasets > /dev/null'
alias r1='pushd $WSD/var/shared/shared/data/ml/raw > /dev/null'
alias w1='pushd $WSD/var/shared/shared/data/ml/weights > /dev/null'
alias m1='pushd $WSD/var/shared/shared/data/ml/models > /dev/null'

# Papers directory.
alias p1='pushd ~/Papers > /dev/null'

# Dotfiles directory.
alias df1='pushd ~/dotfiles > /dev/null'

if [[ `uname` == 'Linux' ]]; then
  # DATA directory.
  alias DATA='pushd /media/josephz/Data/ > /dev/null'

  # REVIEW josephz: Must find an OSX equivalent feature.
  # Git Diff tool. 
  alias gdif='git difftool -t meld -d'
fi

# Dropbox directory.
alias db1='pushd ~/Dropbox/ > /dev/null'

####
# Misc
####
alias activate='source bin/activate'
alias sshXL='sshXL'

function sshXL() {
  port=$1
  dst=$2
  ssh -XL localhost:$port:localhost:$port $dst
}

### NVIDIA Related
# Usage: `check libcuda`, `check libcudart`, `check libcudnn`.
function lib_installed() { /sbin/ldconfig -N -v $(sed 's/:/ /' <<< $LD_LIBRARY_PATH) 2>/dev/null | grep $1; }
function check() { lib_installed $1 && echo "$1 is installed" || echo "ERROR: $1 is NOT installed"; }

####
# Side Stuff
###
alias deep-agent='pushd ~/personal/ws/deep-trading-agent > /dev/null'

####
# School Related
####
alias JOSEPHZ='pushd $JOSEPHZ > /dev/null'
alias UW='pushd $UW_DIR > /dev/null'
alias Stanford='pushd ~/Dropbox/Stanford > /dev/null'
alias CMU='pushd ~/Dropbox/CMU > /dev/null'

####
# Classes
####
alias CS224N='pushd ~/Dropbox/Stanford/CS224N > /dev/null'
alias CSE599='pushd $DRL_DIR > /dev/null'

### CSE490R Robotics.
alias robo='pushd $UW_DIR/CSE490R/labs > /dev/null'
alias ssh-nvidia='ssh nvidia@10.42.0.1'
alias src-devel='source $ROS/devel/setup.bash'

function set_robot() {
  if [ $1 == 'localhost' ]; then 
    export ROS_MASTER_URI=http://localhost:11311
  else 
    export ROS_MASTER_URI=http://10.42.0.1:11311
  fi
  echo 'ROS_MASTER_URI set to ' $ROS_MASTER_URI
}

### CSE473 TA.
alias CSE473='pushd $CSE473 > /dev/null'

### GRAIL.
if [[ ! -f "~/.grail_aliases" ]]; then
  source ~/.grail_aliases
fi

### Secret Stuffs.
if [[ -d ".private_aliases" ]]; then
  for fname in .private_aliases/*; do
    source $fname
  done
fi

