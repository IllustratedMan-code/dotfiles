source .config/bash/genericBashrc.sh

if command -v sway &> /dev/null
   then
       source .config/bash/swayBashrc.sh
fi
