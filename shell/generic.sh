# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
alias e='emacsclient'
alias v='nvim'
alias update-grub='grub-mkconfig -o /boot/grub/grub.cfg'
alias sudo='sudo '
alias c='clear'
alias top='vtop --theme nord'
alias open='xdg-open'

pdfcombine ()
{
   gs -q -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=${1%.*}.pdf -dBATCH ${@:2}
}

# pdfinterleave odd.pdf even.pdf output.pdf
pdfinterleave ()
{
    pdftk A=${1%.*}.pdf B=${2%.*}.pdf shuffle A B output ${3%.*}.pdf
}
pdfinterleavebend ()
{
    pdftk A=${1%.*}.pdf B=${2%.*}.pdf shuffle A Bend-1 output ${3%.*}.pdf
}

export PATH=$PATH:~/.emacs.d/bin
export PATH=$PATH:~/.ghcup/bin
export PATH=$PATH:./node_modules/.bin
export PATH=$PATH:~/.local/bin
