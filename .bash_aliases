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
alias CS224N='pushd ~/Dropbox/Stanford/CS224N > /dev/null'
alias CMU='pushd ~/Dropbox/CMU > /dev/null'
alias CSE421='pushd ~/Dropbox/UW/CSE421 > /dev/null'

### CSE461.
alias CSE461='pushd ~/Dropbox/UW/CSE461 > /dev/null'
alias CSE461B='pushd ~/Dropbox/UW/CSE461/projects/0_NetworkProgrammingUDP/feng-zhong-proj0/B > /dev/null'

### CSE473 TA.
alias CSE473='pushd $CSE473 > /dev/null'

### GRAIL.
alias GRAIL='pushd $GRAIL > /dev/null'
alias im1='pushd $IM1 > /dev/null'
alias im2='pushd $GRAIL/InteractiveModel-Exp > /dev/null'
alias im3='pushd $IM2 > /dev/null'
alias speech2='pushd $IM1/ml/model/speech2 > /dev/null'
alias archive='pushd $IM1/archive > /dev/null'
alias scripts='pushd $IM1/ml/scripts > /dev/null'
alias infra='pushd $IM1/infra > /dev/null'
alias activate='source $IM1/bin/activate'

