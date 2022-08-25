#!/usr/bin/env bash

bool="$(eww get $1)" 
if [ "$bool" = "true" ]; then
    eww update $1=false
else
    eww update $1=true
fi
