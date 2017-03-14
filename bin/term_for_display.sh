#!/bin/bash

hidpi_display="eDP1"
current_display=$(get_display.py)

if [ "$current_display" == "$hidpi_display" ]; then 
  urxvt256c -fn ""xft:TamzenForPowerline:size=16:antialias=false -letsp -1 -lsp -1
else
  urxvt256c
fi
