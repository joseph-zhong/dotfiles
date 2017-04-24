# bash_profile
  
# transfer aliases and functions from ~/.bashrc
if [ -f ~/.bashrc ]
then
  . ~/.bashrc
fi

# general user PATH
export PATH="$PATH:$HOME/bin"
export PATH=/usr/local/bin:$PATH

# CUDA 
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="/usr/local/cuda/lib":$DYLD_LIBRARY_PATH
export LD_LIBRARY_PATH=$DYLD_LIBRARY_PATH
export PATH=$DYLD_LIBRARY_PATH:$PATH
export PATH=/usr/local/cuda/bin:$PATH

