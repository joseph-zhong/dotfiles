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

# Setting PATH for Python 2.7
# export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# Added by set-profile.sh on Mon Jul 31 20:31:04 PDT 2017
# run profile if you find it for an inbound ssh session on ubuntu
[[ -e "$HOME/.profile" ]] && . "$HOME/.profile"
# can just mount as it silently returns if already mounted
ecryptfs-mount-private
