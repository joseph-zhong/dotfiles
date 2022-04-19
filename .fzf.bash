# Setup fzf
# ---------
if [[ ! "$PATH" == */home/josephz/dotfiles/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/josephz/dotfiles/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/josephz/dotfiles/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/josephz/dotfiles/.fzf/shell/key-bindings.bash"
