#!/usr/bin/env bash
#define icons for workspaces 1-9

#initial check for occupied workspaces
MONITOR=$1
for num in $(hyprctl workspaces | grep ID | awk '{print $3}'); do 
  export o"$num"="$num"
done

workspaces() {
    ic=(0    )
    class=(0 inactive inactive inactive inactive)
    for workspace in $(hyprctl monitors | awk 'BEGIN{RS="\n\n"}; {print $4$10}'); do
        if [ ${workspace:0:1} == $MONITOR ]; then
          ic[${workspace:0-1}]=""
          class[${workspace:0-1}]="active"
        fi
    done
    export ic
    export class
}

#initial check for focused workspace
workspaces
module() {
#output eww widget
echo 	"(eventbox :onscroll \"echo {} | sed -e 's/up/-1/g' -e 's/down/+1/g' | xargs hyprctl dispatch workspace\" \
          (box	:class \"workspaces\"	:orientation \"h\" :spacing 5 :space-evenly \"false\" 	\
              (button :onclick \"hyprctl dispatch exec \'~/.config/eww/scripts/switch-workspace.sh 1\'\" :class \"${class[1]}\" \"${ic[1]}\") \
              (button :onclick \"hyprctl dispatch exec \'~/.config/eww/scripts/switch-workspace.sh 2\'\" :class \"${class[2]}\" \"${ic[2]}\") \
              (button :onclick \"hyprctl dispatch exec \'~/.config/eww/scripts/switch-workspace.sh 3\'\" :class \"${class[3]}\" \"${ic[3]}\") \
              (button :onclick \"hyprctl dispatch exec \'~/.config/eww/scripts/switch-workspace.sh 4\'\" :class \"${class[4]}\" \"${ic[4]}\") \
          )\
        )"
}
module
socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r event; do 
workspaces
module
done
