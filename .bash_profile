# bash_profile
  
# transfer aliases and functions from ~/.bashrc
if [ -f ~/.bashrc ]
then
  . ~/.bashrc
fi

# general user PATH
export PATH="$PATH:$HOME/bin"
export PATH=/usr/local/bin:$PATH
# export PATH=$PATH:/Users/Joseph/Library/Android/sdk/platform-tools/

# Added by set-profile.sh on Mon Jul 31 20:31:04 PDT 2017
# run profile if you find it for an inbound ssh session on ubuntu
[[ -e "$HOME/.profile" ]] && . "$HOME/.profile"
# can just mount as it silently returns if already mounted
ecryptfs-mount-private

export PYTHONPATH="$DRL_DIR:$PYTHONPATH"

# added by Anaconda3 5.1.0 installer
export PATH="/Users/josephz/anaconda3/bin:$PATH"

export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Users/josephz/.mujoco/mjpro150/bin

