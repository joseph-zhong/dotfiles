# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/josephz/dotfiles/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/josephz/dotfiles/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/josephz/dotfiles/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/josephz/dotfiles/.fzf/shell/key-bindings.bash"
