#!/bin/bash

# Values to be implemented:
##### - CPUusage 
cpuUsage=$(top -bn1 | awk '/Cpu/ { print $2}')



##### - RAMusage X
# memUsage=$(free -m | awk '/Mem/{print $3}')
memUsage=$(free -m | awk '/Mem/ {used=$3; total=$2; pct=used/total*100; printf "%d MB (%.2f%%)", used, pct}')




##### - Diskusage
# Get a list of all mounted partitions (excluding the header) from the `df` command
partitions=$(df --output=target | tail -n +2)

# Loop through each partition
for partition in $partitions; do
    # Get the disk usage percentage for the current partition
    diskUsage=$(df "$partition" --output=pcent | tail -n 1 | tr -d ' %')
    
    # Print the partition and its usage percentage
    echo "Disk Usage for $partition: $diskUsage%"
done



##### - Systemload
awk '{print $1, $2, $3}' /proc/loadavg




-----------------------------------------------------------------------
##### - Active user sessions
echo "active user session:"
who

##### - Failedlogin attempts
sudo cat /var/log/auth.log | grep 'Failed'


##### - Login by root / sudo users

##- Root
grep 'root' /var/log/auth.log

##- sudo users
grep 'sudo' /var/log/auth.log


##- Failed ssh login attempts
grep "failed password" /var/log/auth.log


----------------------------------------------------------------------------
##### - Network traffic
##- Active network connections
ActiveNetworkConnexions= $ss -tuln


##- Bandwidth usage
stats=$(vnstat -i eth0)

# Extract received and transmitted data using awk
rx=$(echo "$stats" | awk '/today/ {print $2, $3}')  # Received data (RX)
tx=$(echo "$stats" | awk '/today/ {print $4, $5}')  # Transmitted data (TX)

# Display the result
echo "Received data: $rx"
echo "Transmitted data: $tx"

##### - Openports
also under the ss -tuln command



