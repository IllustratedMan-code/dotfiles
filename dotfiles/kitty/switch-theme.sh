#!/bin/bash
rm -f ~/.config/kitty/theme.conf
ln -s ~/.config/kitty/kitty-themes/themes/$1 ~/.config/kitty/theme.conf
