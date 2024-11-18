#!/bin/bash

source  /home/alex/Documents/becode/Cyber/CyberTraining_BeCode_Kamkar3/02-Linux/02-ElDoctor/bashsimplecurses/simple_curses.sh

###########-----> Variables #############

# These variables need to be updated dynamically inside the loop
cpuUsage=""
memUsage=""
sysLoad=""
diskUsage=""
Date=""

###########-----> Hardware sub-function #############

banner () { # outputs the programm's banner

    clear
    echo "                                           #####################################################################"
    echo "                            ###################################################################################################"
    echo "                    #################################################################################################################"
    echo "                 ###                                                                                                                 ###"
    echo "              ###     ░▒▓████████▓▒░▒▓█▓▒░             ░▒▓███████▓▒░ ░▒▓██████▓▒░ ░▒▓██████▓▒░▒▓████████▓▒░▒▓██████▓▒░░▒▓███████▓▒░     ###"
    echo "             ###      ░▒▓█▓▒░      ░▒▓█▓▒░             ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░      ###"
    echo "            ###       ░▒▓█▓▒░      ░▒▓█▓▒░             ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░       ###"
    echo "            ###       ░▒▓██████▓▒░ ░▒▓█▓▒░             ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░        ###"
    echo "            ###       ░▒▓█▓▒░      ░▒▓█▓▒░             ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░       ###"
    echo "              ###     ░▒▓█▓▒░      ░▒▓█▓▒░             ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░      ###"
    echo "               ###    ░▒▓████████▓▒░▒▓████████▓▒░      ░▒▓███████▓▒░ ░▒▓██████▓▒░ ░▒▓██████▓▒░  ░▒▓█▓▒░   ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░     ###"
    echo "                 ###                                                                                                                   ###"
    echo "                    ########################################  Taking Good Care Of Your Linux  #########################################"
    echo "                           ###################################################################################################"
    echo "                                          ##############################-cCrapiXx-##############################"
    echo "                                                                 #######################"
    echo ""
    echo ""

}



hardware() {
    # Get the updated hardware info every time the function is called

    # Get CPU usage
    cpuUsage=$(top -bn1 | awk '/Cpu/ { print $2 "%" }')

    # Get RAM usage
    memUsage=$(free -m | awk '/Mem/ {used=$3; total=$2; pct=used/total*100; printf "%d MB (%.2f%%)", used, pct}')

    # Get system load (5 min)
    sysLoad=$(awk '{print $2}' /proc/loadavg)
    
    # Get the date (store it in the global variable)
    Date=$(date)

    # Get all partition names (excluding the header)
    partitions=$(df --output=target | tail -n +2)

    # Declare an associative array to store partition names and usage
    declare -A partition_usage

    # Loop through each partition to gather usage data
    for partition in $partitions; do
        # Get the disk usage percentage for the partition, stripping spaces and "%" sign
        usage=$(df "$partition" --output=pcent | tail -n 1 | tr -d ' %')
        
        # Store the usage in the associative array, using the partition name as the key
        partition_usage["$partition"]="$usage"
    done

    # Create a window and display the hardware information
    window "🖥️  Hardware 🖥️" "blue" "100%"
        # Display the tabbed header with the titles: #CPU usage, #Ram usage, #System load (5 min)
        append_tabbed "CPU usage🧠🔥 :Ram usage 💾 :🧠System load-5mn" 3

        # Display the values for CPU, RAM, and system load in the same tabbed format
        append_tabbed "$cpuUsage:$memUsage:$sysLoad" 3

        # Add a separator
        addsep
        
        append "Memory usage 💿"
        append "---------------------"

        # Initialize variables to build tabbed rows
        partition_list=""
        usage_list=""
        count=0

        # Loop through the partitions and create rows of 3
        for partition in "${!partition_usage[@]}"; do
            partition_list+="$partition:"
            usage_list+="${partition_usage[$partition]}%:"
            ((count++))

            # If we have 3 items, append them as a row
            if ((count == 3)); then
                # Append the row of partitions and their usage
                append_tabbed "$partition_list" 3
                append_tabbed "$usage_list" 3
                append "--------------------------------------------------------------------------"
                # Reset partition list and usage list for the next row
                partition_list=""
                usage_list=""
                count=0
            fi
        done

        # If there are leftover partitions (less than 3 in the last row), append them
        if ((count > 0)); then
            append_tabbed "$partition_list" 3
            append_tabbed "$usage_list" 3
        fi
    endwin
}



###########-----> Variables declaration ############

failedSSH=$(grep "failed password" /var/log/auth.log | wc -l)
failedRoot=$(grep "Failed password" /var/log/auth.log | grep "root" | wc -l)
failedSudo=$(grep "sudo:.*authentication failure" /var/log/auth.log | wc -l)
bruteValue=$(grep "Failed password" /var/log/auth.log | awk '{print $(NF-3)}' | sort | uniq -c | sort -n | tail -n 20)
bruteForceValue=""
activeSessions=$(who)
openPortsNumber=$(ss -tuln | grep -E "LISTEN" | wc -l)  # Counts thenumber of open ports on te machine
openPorts=$(netstat -tuln | grep LISTEN)  # Displays the open ports and services running on it
dataExchange=$(netstat -i | awk 'NR>2 {print $1, $3, $7}') 
#activeNetworkConnexions=$(ss -tuln | grep -E "LISTEN" | wc -l) 


###########-----> getBrute sub-function #############

getBrute () {
    if [ -z "$bruteValue" ]; then
        bruteForceValue="No brute force attempt detected 😎"
    else
        bruteForceValue="☠️☠️☠️$bruteValue"
    fi
}


###########-----> Main function #############


main() {

    banner        # outputs banner

    # create a window for Date
    window "📅 Your location in time 🌎" "green" "100%"
    append "$Date"
    endwin
    
        echo "   ####################################################################################################################################################################################"

    # create a window and refresh hardware info
    hardware #launches hardware function


    # move on the next column
    
    getBrute #Launches getBrute function
    window "🛠️ Sessions 👀" "yellow" "50%"
    append "$activeSessions"
    append " "
    addsep  
    append "🔒Failed logins👾" "red" "50%"
    addsep
    append_tabbed "Sudo attempts: Root attempts: SSH attempts" 3
    append_tabbed "$failedSudo: $failedRoot :$failedSSH" 3
    addsep
    append "Brute force candidate"
    append "---------------------"
    append "$bruteForceValue"
    endwin
    
    col_right
    
    window "🌐 Network 📡" "magenta" "50%"
    append "Data exchange"
    append "---------------------"
    append "$dataExchange"
    addsep
    append "Open ports details"
    append "---------------------"
    append "$openPorts"
    endwin
}


# Continuously call main and refresh every 1.0 seconds
main_loop -t 1.0
