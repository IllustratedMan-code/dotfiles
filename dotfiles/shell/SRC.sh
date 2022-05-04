source ~/.config/shell/generic.sh

if echo $SHELL | grep -q "bash"; then
    source ~/.config/shell/bash.sh
fi

if echo $SHELL | grep -q "zsh"; then
    source ~/.config/shell/zsh.sh
fi

if command -v sway &> /dev/null
   then
       source ~/.config/shell/swayBashrc.sh
fi
