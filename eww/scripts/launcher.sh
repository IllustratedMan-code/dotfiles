#!/usr/bin/env bash

#/etc/profiles/per-user/david/share/applications
#/run/current-system/sw/share/applications

search_string=$1

search_path="/etc/profiles/per-user/$USER/share/applications /run/current-system/sw/share/applications"

get_attr(){
    a=$(sed -nr "s|^$1=(\w)|\1|p" $2)
    echo "$a" | head -1
}

launcher="(box :class \"launcher\" :orientation \"v\" "

create_elem(){
    echo "(box :class \"program\" :orientation \"h\" 
            (button  :onclick \"exec $1\" :class \"Name\" \"$2\" )
        )"
}

rank=0
eww update launcher-app="echo fart"
while read -r line; do
    rank=$((rank+1))
    line=(${line//:/ })
    desktop=${line[0]}
    name=$(get_attr "Name" $desktop) 
    icon=$(get_attr "Icon" $desktop)
    exec=$(get_attr "Exec" $desktop)
    elem=$(create_elem "$exec" "$name")
    launcher="$launcher$elem"
    if [ $rank == 1 ]; then
        eww update launcher-app="$exec"
        echo $exec
    fi
    if [ $rank -ge 10 ]; then
        break
    fi
done <<<$(grep -iR "^Name=.*$search_string" $search_path)

launcher="$launcher)"
echo "$launcher"
eww update launcher="$launcher"


