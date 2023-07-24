#!/usr/bin/env bash
hyprctl monitors | grep "focused: yes" -B 11 | awk 'NR==1 {print $2}'
