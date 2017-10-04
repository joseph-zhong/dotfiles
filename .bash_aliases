# Bash Aliases 

####
# Standard directories
####
alias e1='pushd $WSD/git/src > /dev/null'
alias s1='pushd $WSD/git/src/common/ml/scripts > /dev/null'
alias md1='pushd $WSD/git/src/common/ml/pymod/surroundio/ml/model > /dev/null'
alias dd1='pushd $WSD/git/src/common/ml/pymod/surroundio/ml/data > /dev/null'

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
# School Related
####
alias UW='pushd ~/Dropbox/UW > /dev/null'
alias Stanford='pushd ~/Dropbox/Stanford > /dev/null'
alias CMU='pushd ~/Dropbox/CMU > /dev/null'
alias CSE421='pushd ~/Dropbox/UW/CSE421 > /dev/null'
alias CSE461='pushd ~/Dropbox/UW/CSE461 > /dev/null'
alias CS224N='pushd ~/Dropbox/Stanford/CS224N > /dev/null'

### TA.
if [[ `hostname` == 'attu'* ]]; then
  alias CSE473='pushd /cse/web/courses/cse473/17au > /dev/null'
else
  alias CSE473='pushd ~/Dropbox/UW/TA/CSE473 > /dev/null'
fi

### GRAIL.
if [[ `hostname` == 'flatwhite'* ]]; then
  alias GRAIL='pushd ~/GRAIL > /dev/null'
  alias im1='pushd ~/GRAIL/InteractiveModel > /dev/null'
  alias im2='pushd ~/GRAIL/InteractiveModel2 > /dev/null'
  alias im3='pushd ~/GRAIL/InteractiveModelnb > /dev/null'
else
  alias GRAIL='pushd $DEVD/GRAIL > /dev/null'
  alias im1='pushd $DEVD/GRAIL/InteractiveModel > /dev/null'
  alias im2='pushd $DEVD/GRAIL/InteractiveModel2 > /dev/null'
  alias im3='pushd $DEVD/GRAIL/InteractiveModelnb > /dev/null'
fi
alias activate='source bin/activate'


