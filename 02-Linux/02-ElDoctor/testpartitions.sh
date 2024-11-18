#!/bin/bash

source  /home/alex/Documents/becode/Cyber/CyberTraining_BeCode_Kamkar3/02-Linux/02-ElDoctor/bashsimplecurses/simple_curses.sh


# Example setup for CPU, RAM, and system load
cpuUsage="45%"  # Replace with actual CPU usage command
memUsage="60%"  # Replace with actual RAM usage command
sysLoad="1.25"  # Replace with actual system load (5 min)

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
window "Hardware" "blue" "50%"
    # Display the tabbed header with the titles: #CPU usage, #Ram usage, #System load (5 min)
    append_tabbed "#CPU usage:#Ram usage:#System load (5 min)" 3

    # Display the values for CPU, RAM, and system load in the same tabbed format
    append_tabbed "$cpuUsage:$memUsage:$sysLoad" 3

    # Add a separator
    addsep

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


