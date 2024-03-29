# Bash Aliases 

# Python hacks.
alias p3=python3
alias ipython3="python3 -m IPython"
alias bpython="python3 -m bpython"
alias venv3="python3 -m venv"

###
# Directories
###
# Papers directory.
alias pp1='pushd $PAPERS > /dev/null'

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

# Git. 
alias gdif='git difftool -t meld -d'
alias gs="~/.sh_utils/git_awesome_status.py"
alias mine="git log --format=short --author='Zhong'"
alias author_of_all_time='git log | grep Author | hist_common.py'
alias fix-lfs="git lfs uninstall && git reset  && git lfs install"

###
# CMake
###
cbuild() {
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
alias c_deactivate='conda deactivate'
alias grep='grep -ni --line-buffered --exclude=\*svn\* --color=auto'
alias antigrep='grep --color=never -v'
alias rebash='source ~/.bashrc'

# VSCode Helpers.
VSCODE="'/Users/josephz/Library/Application Support/VS Code @ FB/User'"
alias pull-vscode='[ -d "${VSCODE}" ] && cp ${VSCODE}/*.json ${DOTFILES}/vscode_settings/'
alias push-vscode='[ -d "${VSCODE}" ] && cp ${DOTFILES}/vscode_settings/*.json ${VSCODE}/'

# Locating code-snippets.
highlight () {
    GREP_COLOR=34 grep --line-buffered --exclude=\*svn\* --color=auto -i --line-buffered --color=always -E "${1}|$"
}
highlightgray () 
{ 
      GREP_COLOR='90' grep --line-buffered --exclude=\*svn\* --color=auto -i --line-buffered --color=always -E "${1}|$"
}
loc() {
    find . -iname "*$1*" 2>/dev/null | antigrep "\.pyc" | antigrep "\./vendor/" | antigrep "\./go-build/\.go/" | antigrep "./node_modules/" | highlight $1
}
shallowloc() {
    find . -iname "*$1*" -maxdepth 3 2>/dev/null | antigrep "\.pyc" | antigrep "\./vendor/" | antigrep "\./go-build/\.go/" | antigrep "./node_modules/" | highlight $1
}
deeploc() {
    find . -iname "*$1*" -maxdepth 6 2>/dev/null | antigrep "\.pyc" | antigrep "\./vendor/" | antigrep "\./go-build/\.go/" | antigrep "./node_modules/" | highlight $1
}

# SSH related.
sshXL() {
  port=$1
  dst=$2
  ssh -XL localhost:$port:localhost:$port $dst
}
alias tmux="TERM=screen-256color-bce tmux"

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

# Xpra X Forwarding
alias xpra_start="PATH='/usr/lib/xorg:$PATH' xpra start"

### Open/Xdg-open
if [[ `uname` != "Darwin" ]]; then
  alias open='xdg-open'
fi

### NVIDIA Related
# Usage: `check libcuda`, `check libcudart`, `check libcudnn`.
lib_installed() { 
  /sbin/ldconfig -N -v $(sed 's/:/ /' <<< $LD_LIBRARY_PATH) 2>/dev/null | grep $1;
}
check() { 
  lib_installed $1 && echo "$1 is installed" || echo "ERROR: $1 is NOT installed"; 
}

####
# Kubernetes.
####
alias kctl="kubectl"
alias ka1="pushd ~/.kube_aliases > /dev/null/"
if [ -h ~/.kube_aliases ]; then
  source ~/.kube_aliases
fi

####
# Docker.
####
alias prune-docker-images="docker system prune --volumes -a"

####
# Side Stuff
###

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
alias pa1="pushd ~/.private_aliases > /dev/null"
if [ -h ~/.private_aliases ]; then
  for fname in ~/.private_aliases/*; do
    if [[ -f $fname && "$fname" != *README.md ]]; then
      source $fname
    fi
  done
fi


### Other Stuffs.
#### Search.
alias search_source='grep --exclude=\*svn\* --exclude="*.h" --exclude="g_*" --exclude="*.pl" -iIr * -e'
alias grep_ips="grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'"

search_and() {
    grep -E -iIr * -e "$1.*$2|$2.*$1"
}
search_or() {
    grep -E -iIr * -e "$1|$2"
}
grep_or() {
    local IFS="|"; grep -i -E -e "$*";
}
#join () {
#    local IFS="$1"; shift; echo "$*";
#}
grep_and() {
    #local IFS="$1"; echo "$*";
    c="awk '/$1/"
    args=("$@")
    for ((i=1; i<${#args[@]}; i++))
    do
        c="$c && /${args[i]}/"
    done
    c="$c'"
    #for var in "$@"
    #do
    #    #c="$c /$var/"
    #    c="$c | grep -i $var"
    #done
    #echo $c
    eval $c
    #awk '/word1/ && /word2/'
}


