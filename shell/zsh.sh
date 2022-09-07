# this will get overwritten if oh-my-zsh is used
PS1='%F{green}%~%f > '
eval "$(direnv hook zsh)"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY

DEFAULT_USER=$USER
