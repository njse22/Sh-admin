#!/bin/bash

## COLORS 
RED='\033[0;31m'    # Color Rojo
GREEN='\033[0;32m'  # Color Verde
BLUE='\033[0;34m'   # Color Azul
NC='\033[0m'        # Sin Color

echo -e "${BLUE}                                                        
  ▄▄▄▄  █                        █           ▀          
 █▀   ▀ █ ▄▄           ▄▄▄    ▄▄▄█  ▄▄▄▄▄  ▄▄▄    ▄ ▄▄  
 ▀█▄▄▄  █▀  █         ▀   █  █▀ ▀█  █ █ █    █    █▀  █ 
     ▀█ █   █   ▀▀▀   ▄▀▀▀█  █   █  █ █ █    █    █   █ 
 ▀▄▄▄█▀ █   █         ▀▄▄▀█  ▀█▄██  █ █ █  ▄▄█▄▄  █   █ 
                                                                                                                
"
typeset info=" Sh-admin is a little Bash tool  " 

max_proccess(){ 
  ps -ao "%U %C %p" --sort=cpu | tail -6 
}


