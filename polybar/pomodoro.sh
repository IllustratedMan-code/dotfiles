#!/usr/bin/env bash

underline_color="%{u#99c2ff}%{+u}"
pomo_message=$(emacsclient -e '(david/org-pomodoro-time)' | cut -d '"' -f 2)
echo ${underline_color}${pomo_message}
