rm -rf $HOME/.config/shell
cp -r ./shell $HOME/.config/shell

SRC="$HOME/.config/shell/SRC.sh"
grep -q $SRC $HOME/.bashrc || sed -i "1s,^,source $SRC \n," $HOME/.bashrc

SRC="$HOME/.config/shell/SRC.sh"
grep -q $SRC $HOME/.zshrc || sed -i "1s,^,source $SRC \n," $HOME/.zshrc
