#!/bin/bash

source  /home/alex/Documents/becode/Cyber/CyberTraining_BeCode_Kamkar3/02-Linux/02-ElDoctor/bashsimplecurses/simple_curses.sh

# Define colors for nice formatting
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color






# Disk Usage
# This part is directly handled in the output section bellow.



# Active user sessions
activeSessions=$(who | wc -l) X

# Active Network Connections
ActiveNetworkConnexions=$(ss -tuln | grep -E "LISTEN" | wc -l) 

# Failed SSH login attempts
failedSSH=$(grep "failed password" /var/log/auth.log | wc -l)

# Bandwidth Usage (today)
stats=$(vnstat -i eth0)
rx=$(echo "$stats" | awk '/today/ {print $2, $3}')  # Received data (RX)
tx=$(echo "$stats" | awk '/today/ {print $4, $5}')  # Transmitted data (TX)

# Open Ports
openPorts=$(ss -tuln | grep -E "LISTEN" | wc -l)

# Login Attempts for root and sudo users
rootLogins=$(grep 'root' /var/log/auth.log | wc -l)
sudoLogins=$(grep 'sudo' /var/log/auth.log | wc -l)




############### Output in a Table Format ###############
clear
echo -e "                                                  #######################"
echo -e "                           #####################################################################"
echo -e "            ###################################################################################################  "
echo -e "     #################################################################################################################"
echo -e "  ###                                                                                                                 ###"
echo  " ###   ░▒▓████████▓▒░▒▓█▓▒░             ░▒▓███████▓▒░ ░▒▓██████▓▒░ ░▒▓██████▓▒░▒▓████████▓▒░▒▓██████▓▒░░▒▓███████▓▒░    ###"
echo  "###    ░▒▓█▓▒░      ░▒▓█▓▒░             ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░    ###"
echo  "###    ░▒▓█▓▒░      ░▒▓█▓▒░             ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░    ###"
echo  "###    ░▒▓██████▓▒░ ░▒▓█▓▒░             ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░     ###"
echo  "###    ░▒▓█▓▒░      ░▒▓█▓▒░             ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░    ###"
echo  "###    ░▒▓█▓▒░      ░▒▓█▓▒░             ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░    ###"
echo  " ###   ░▒▓████████▓▒░▒▓████████▓▒░      ░▒▓███████▓▒░ ░▒▓██████▓▒░ ░▒▓██████▓▒░  ░▒▓█▓▒░   ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░   ###"
echo -e "  ###                                                                                                                 ###"
echo -e "     ########################################  Taking Good Care Of Your Linux  #######################################"
echo -e "            ###################################################################################################"
echo -e "                           ##############################-cCrapiXx-##############################"
echo -e "                                                  #######################"
echo -e ""
echo -e ""
printf "%-15s : %-5s\n" "CPU Usage" "$cpuUsage%"
echo -e "${BLUE}#####${NC}"
#
printf "%-25s : %-10s\n" "RAM Usage" "$memUsage"
echo -e "${BLUE}#####${NC}"
#
echo -e "${BLUE}Disk Usage:${NC}"
partitions=$(df --output=target | tail -n +2)
for partition in $partitions; do
    usage=$(df "$partition" --output=pcent | tail -n 1 | tr -d ' %')
    echo -e "$partition: $usage%"
done
echo -e "${BLUE}#####${NC}"
#
printf "%-25s : %-10s\n" "System Load" "$sysLoad"
echo -e "${BLUE}#####${NC}"
#
printf "%-25s : %-10s\n" "Failed Login Attempts" "$failedLoginAttempts"
echo -e "${BLUE}#####${NC}"
#
printf "%-25s : %-10s\n" "Active User Sessions" "$activeSessions"
echo -e "${BLUE}#####${NC}"
#
printf "%-25s : %-10s\n" "Active Network Connections" "$ActiveNetworkConnexions"
echo -e "${BLUE}#####${NC}"
#
printf "%-25s : %-10s\n" "Failed SSH Login Attempts" "$failedSSH"
echo -e "${BLUE}#####${NC}"
#
printf "%-25s : %-10s\n" "Received Data (today)" "$rx"
echo -e "${BLUE}#####${NC}"
#
printf "%-25s : %-10s\n" "Transmitted Data (today)" "$tx"
echo -e "${BLUE}#####${NC}"
#
printf "%-25s : %-10s\n" "Open Ports" "$openPorts"
echo -e "${BLUE}#####${NC}"
#
printf "%-25s : %-10s\n" "Root Login Attempts" "$rootLogins"
echo -e "${BLUE}#####${NC}"
#
printf "%-25s : %-10s\n" "Sudo Usage" "$sudoLogins"
echo -e "${BLUE}#####${NC}"

echo -e "${BLUE}#######################################${NC}"



main(){
    # create a window
    window "Example" "blue" "50%"
        append "Hello world"
        addsep
        append "The date command"
        append_command "date"
    endwin

    # move on the next column
    col_right

    # and create another window
    window "Example 2" "red" "50%"
        append "Hello world"
        addsep
        append "The date command"
        append_command "date"
    endwin
}
main_loop -t 0.5 $@
