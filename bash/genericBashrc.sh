# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\w > '

set -o vi

alias pm='paru'
alias ls='ls --color=auto'
alias pmi='paru -S'
alias pms='paru -Ss'
alias pmr='paru -R'
alias vi='nvim'
alias vim='nvim'
alias vimedit='export EDITOR=nvim && sudoedit'
alias emacsedit='export EDITOR=emacsclient && sudoedit'
alias emacs='emacsclient'
alias e='emacsclient'
alias v='nvim'
alias update-grub='grub-mkconfig -o /boot/grub/grub.cfg'
alias sudo='sudo '
alias c='clear'

export PATH=$PATH:~/.emacs.d/bin
