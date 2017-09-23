# Bash Aliases 

####
# Standard directories
####
alias e1='pushd ~/ws/git/src > /dev/null'
alias s1='pushd ~/ws/git/src/common/ml/scripts > /dev/null'
alias md1='pushd ~/ws/git/src/common/ml/pymod/surroundio/model > /dev/null'
alias dd1='pushd ~/ws/git/src/common/ml/pymod/surroundio/data > /dev/null'

alias tb1='pushd ~/ws/var/shared/shared/data/ml/tb > /dev/null'
alias d1='pushd ~/ws/var/shared/shared/data/ml/datasets > /dev/null'
alias r1='pushd ~/ws/var/shared/shared/data/ml/raw > /dev/null'
alias w1='pushd ~/ws/var/shared/shared/data/ml/weights > /dev/null'
alias m1='pushd ~/ws/var/shared/shared/data/ml/models > /dev/null'

# Papers directory.
alias p1='pushd ~/Papers > /dev/null'

# Dotfiles directory.
alias df1='pushd ~/dotfiles > /dev/null'

if [[ `uname` == 'Linux' ]]; then
  # DATA directory.
  alias DATA='pushd /media/josephz/Data/ > /dev/null'
fi

# Dropbox directory.
alias db1='pushd ~/Dropbox/ > /dev/null'

####
# School Related
####
alias UW='pushd  ~/Dropbox/UW > /dev/null'
alias Stanford='pushd  ~/Dropbox/Stanford > /dev/null'
alias CMU='pushd  ~/Dropbox/CMU > /dev/null'
alias GRAIL='pushd ~/Dropbox/UW/GRAIL > /dev/null'
alias CSE421='pushd ~/Dropbox/UW/CSE421 > /dev/null'
alias CSE461='pushd ~/Dropbox/UW/CSE461 > /dev/null'
alias CS224N='pushd ~/Dropbox/Stanford/CS224N > /dev/null'

