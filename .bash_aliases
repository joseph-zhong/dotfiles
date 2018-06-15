# Bash Aliases 

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

###
# CMake
###
function cbuild() {
  build=$1
  target=$2
  nproc=$(nproc --all)
  echo "Building '$target' to directory '$build' with '$nproc' processes"
  cmake --build $build --target $target -- -j $nproc
  echo ""
  echo "Done building!"
  echo ""
}

####
# Misc
####
alias activate='source bin/activate'

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
alias PHIL240='pushd ~/Dropbox/UW/PHIL240 > /dev/null'
alias CSE421='pushd ~/Dropbox/UW/CSE421 > /dev/null'
alias CSE490R='pushd ~/Dropbox/UW/CSE490R > /dev/null'
alias CSE599='pushd $DRL_DIR > /dev/null'

### CSE490R Robotics.
alias robo='pushd $UW_DIR/CSE490R/labs > /dev/null'
alias ssh-nvidia='ssh nvidia@10.42.0.1'
alias scp-to-nvidia='scp_to_nvidia()'
alias scp-from-nvidia='scp_from_nvidia()'
alias src-devel='source $ROS/devel/setup.bash'

function scp_to_nvidia() {
  cmd=scp -vr $1 nvidia@10.42.0.1:~/catkin_ws/src/lab2/src
  echo "Running " $cmd
}

function scp_from_nvidia() {
  cmd="scp -vr nvidia@10.42.0.1:~/catkin_ws/src/lab2/src/$1 ."
}

function set_robot() {
  if [ $1 == 'localhost' ]; then 
    export ROS_MASTER_URI=http://localhost:11311
    unset ROS_IP
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
if [ -h ~/.private_aliases ]; then
  for fname in ~/.private_aliases/*; do
    source $fname
  done
fi

