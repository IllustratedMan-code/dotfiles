rm -rf $HOME/.config/bash
cp -r ./bash $HOME/.config/bash

SRC="$HOME/.config/bash/bashrcSRC.sh"
grep -q $SRC $HOME/.bashrc || sed -i "1s,^,source $SRC \n," $HOME/.bashrc
