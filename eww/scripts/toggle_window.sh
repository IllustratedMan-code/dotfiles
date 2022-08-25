#!/usr/bin/env bash

if eww windows | grep "*$1" -q; then
    eww close $1
else
    eww open $1
fi
