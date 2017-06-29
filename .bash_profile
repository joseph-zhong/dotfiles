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
