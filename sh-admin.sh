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
${NC}
"
typeset info=" Sh-admin is a little Bash tool with five funtions that you can see in the options menu (type 6) " 
typeset menu="
   1. show the five proccess that more CPU consume in this moment \n
  2. show the filesystems that are conected with the machine \n
  3. show the file with the maximun size in one directory  \n
  4. show the actual value of the RAM Memory and SWAP memory \n
  5. show the actual value of the RAM Memory and SWAP memory \n
  6. show this menu \n
  7. to show information about this tool \n
  8. to exit \n" 

## FUNTIONS 

max_proccess(){ 
  # This funtion show the first 5 proccess that consume more CPU 
  ps -ao "%U %C %p" --sort=cpu | head -n 6 
}

show_filesystems(){
  # this funtion show the filesystems that are conected with the machine
  df -Th -Bk | grep '/dev/sd'
}

show_maxfile(){
  # this funtion show the file with the maximun size in one directory	
  echo "type the name of your directory"
  read directory 
  du -ah $directory | sort -n -r | head -n 1
}

show_memory(){
  # This funtion show the actual value of the RAM Memory and SWAP memory
  free | grep Mem | awk '{printf("RAM\nEn uso: %iB %.4f%s\nLibre:%iB %.4f%s\nDisponible:%iB %.4f%s\n", $3, $3/$2 * 100.0, "%", $4, $4/$2 * 100.0, "%", $7, $7/$2 * 100.0, "%")}'
  free | grep Swap | awk '{printf("SWAT\nEn uso: %iB %.4f%s\nLibre:%iB %.4f%s\nDisponible:%iB %.4f%s\n", $3, $3/$2 * 100.0, "%", $4, $4/$2 * 100.0, "%", $7, $7/$2 * 100.0, "%")}'
}
show_networks(){
  # This funtion show the actual enabled networks
  nmcli d wifi 
}
echo -e $menu 

while :
	do
	read op 
	case $op in 
		1 ) max_proccess ;;
		2 ) show_filesystems;;
		3 ) show_maxfile;;
		4 ) show_memory;;
		5 ) show_networks;;
		6 ) echo -e $menu;;
		7 ) echo -e $info;;
		8 ) echo -e "${BLUE}                        
 ▄▄▄▄▄                         ▄   
 █    █ ▄   ▄   ▄▄▄            █   
 █▄▄▄▄▀ ▀▄ ▄▀  █▀  █           █   
 █    █  █▄█   █▀▀▀▀           ▀   
 █▄▄▄▄▀  ▀█    ▀█▄▄▀           █   
         ▄▀                        
        ▀▀                         
			${NC}"; exit 1
	esac
done
