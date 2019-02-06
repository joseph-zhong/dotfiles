# Bash Aliases 

# Python hacks.
alias p3=python3
alias p2=python2.7
alias python2=python2.7
alias ipython3="python3 -m IPython"
alias bpython3="python3 -m bpython"

###
# Directories
###
# Papers directory.
alias p1='pushd $PAPERS > /dev/null'

# Dotfiles directory.
alias df1='pushd $DOTFILES > /dev/null'

# Experiments directory.
alias je1='pushd $GOOGLE_DRIVE/Work/personal/experiments > /dev/null'

# Cloud directories.
alias db1='pushd $DROPBOX/ > /dev/null'
alias gd1='pushd $GOOGLE_DRIVE/ > /dev/null'

if [[ `uname` == 'Linux' ]]; then
  # DATA directory.
  alias DATA='pushd /media/josephz/Data/ > /dev/null'
fi

# Git Diff tool. 
alias gdif='git difftool -t meld -d'

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
alias dict='cat /usr/share/dict/words'
alias activate='source bin/activate'

function sshXL() {
  port=$1
  dst=$2
  ssh -XL localhost:$port:localhost:$port $dst
}

# Xpra X Forwarding
alias xpra_start="PATH='/usr/lib/xorg:$PATH' xpra start"

### Linux/OSX Thingies
### set/get clip
# XClip on Linux and pbcopy/paste on OSX
if hash xclip 2>/dev/null; then
  alias setclip="xclip -selection c"
  alias getclip="xclip -selection c -o"
elif [[ `uname` == 'Darwin' ]]; then
  alias setclip="pbcopy"
  alias getclip="pbpaste"
fi

### Xpra on Linux
function xpra_start() {
  export DISPLAY=$1
  xpra start $1
}

### Open/Xdg-open
if [[ `uname` != "Darwin" ]]; then
  alias open='xdg-open'
fi

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

####
# Classes
####
if [ -d $SCHOOL ]; then
  for fname in $(ls -d $SCHOOL/*/); do 
    class=$(basename $fname)
    alias $class='pushd $SCHOOL/'$class' > /dev/null'
  done
fi
alias SCHOOL='pushd $SCHOOL > /dev/null'
alias CS224N='pushd $UNIVERSITY/Stanford/CS224N > /dev/null'

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

