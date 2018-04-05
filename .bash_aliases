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
alias sshXL='ssh -XL localhost:8888:localhost:8888'

####
# School Related
####
alias JOSEPHZ='pushd $JOSEPHZ > /dev/null'
alias UW='pushd ~/Dropbox/UW > /dev/null'
alias Stanford='pushd ~/Dropbox/Stanford > /dev/null'
alias CMU='pushd ~/Dropbox/CMU > /dev/null'

####
# Classes
####
alias CS224N='pushd ~/Dropbox/Stanford/CS224N > /dev/null'
alias CSE421='pushd ~/Dropbox/UW/CSE421 > /dev/null'
alias CSE490R='pushd ~/Dropbox/UW/CSE490R > /dev/null'

### CSE490R Robotics.
alias robo='pushd ~/Dropbox/UW/CSE490R/labs > /dev/null'
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
alias setrobot='set_robot'

### CSE473 TA.
alias CSE473='pushd $CSE473 > /dev/null'

### GRAIL.
alias GRAIL='pushd $GRAIL > /dev/null'
alias im1='pushd $IM1 > /dev/null'
alias im2='pushd $GRAIL/InteractiveModel-Exp > /dev/null'
alias im3='pushd $IM2 > /dev/null'
alias im4='pushd /cse/web/homes/josephz/demo/InteractiveModelChat > /dev/null'

alias speech2='pushd $IM1/ml/model/speech2 > /dev/null'
alias archive='pushd $IM1/archive > /dev/null'
alias scripts='pushd $IM1/ml/scripts > /dev/null'
alias infra='pushd $IM1/infra > /dev/null'

alias personal='pushd $IM1/personal > /dev/null'
alias demo='pushd $IMD1/personal/demo > /dev/null'
alias web='pushd $IM1/personal/demo/web > /dev/null'
alias ds1='pushd $IM1/personal/externals/DeepSpeech > /dev/null'

alias supasorn1='pushd $IM2/supasorn/ > /dev/null'
alias supasorn2='pushd $IM2/supasorn2/ > /dev/null'
alias supasorn3='pushd $IM2/supasorn2nb/ > /dev/null'

alias ab1='source $IM_DIR_VIRTUALENV1/bin/activate'
alias ab2='source $IM_DIR_VIRTUALENV2/bin/activate'
alias ab3='source $IM_DIR_VIRTUALENV3/bin/activate'
alias ab4='source $IM_DIR_VIRTUALENV4/bin/activate'

function cbuild() {
  if [[ $2 == 'release' ]]; then
    cmd="cmake --build $IM_DIR/src/bin2 --target $1 -- -j $(nproc --all)"
  else 
    cmd="cmake --build $IM_DIR/src/debug --target $1 -- -j $(nproc --all)"
  fi
  $cmd
}

alias cbuild='cbuild'
alias creload='/homes/grail/josephz/Applications/clion-2017.3.2/bin/cmake/bin/cmake -DCMAKE_BUILD_TYPE=Debug -G "CodeBlocks - Unix Makefiles" /homes/grail/josephz/GRAIL/InteractiveModel/src'

### Secret Stuffs.
if [[ -d ".private_aliases" ]]; then
  for fname in .private_aliases/*; do
    source $fname
  done
fi

