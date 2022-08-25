MONITOR=1

workspace() {
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
workspace
echo ${ic[2]}
echo ${ic[1]}
echo ${ic[3]}




#hyprctl monitors | grep -B 6 "focused: yes" | awk ' BEGIN{RS="--"; FS=")"}; {print $2}'
