##############__Configuring a simple network__##############
  
  
# Step 1// Get the machines
I am getting the machines mentioned in the mission file: 3 computers and a switch. I am performing an IOS version check of the switch using the "show version" command in privileged EXEC mode ("enable" command). It is the right version.

# Step 2// Physical connections
It is time to connect the machines with the right cables. I use copper straight-through cables.

# Step 2// IP addressing
All 3 computers are assigned their proper IP addresses and subnet masks. This operation is done by following the "desktop>IP configuration" path and entering the given values.

# Step 4// Testing LAN connectivity
A ping test is performed for all 3 computers. In terminal, I use the following command: $ ping <target ip>. Ping test is passed with success.

# Step 5// Achieving internet connectivity
To connect this LAN to the internet, I must add 3 devices to this design: 2 routers and a server connected to one of the routers to test connectivity with PCs from the LAN. Router and switch are connected with copper straight-through cables and the server is connected to its router with a copper cross-over cable. in between, the two routers are connected to each other with a serial cable.

¤ Internet side:
The server is attributed an IP address of 192.168.4.2, a subnet mask of 255.255.255.0 and a default gateway of 192.168.4.1. This default gateway value is then configured as the IP address of he router on the same connection interface (fastethernet1/0).

¤ LAN side:
on the LAN side, all 3 computers are assigned 192.168.1.1 as a default gateway and the router gets it as its IP address on connection interface fastethernet0/0.

# Step 6// Testing internet connectivity:
To test if our LAN can access the outside world, a ping test between "the internet server" and computers from the LAN must be performed. As ICMP packets are received, our network is capable of internet connectivity. However, the configuration of a DNS server would harden the proof of concept of internet connectivity.

# Step 7// DNS configuration
To configure the server as a DNS server, I must go to the config page of the server. From there the gateway/DNS ipv4 button should be ticked as static, and the DNS server form must be filled with the IP address of the server itself.
Then we must go to the service tab of the server. From this point, we click on the DNS tab and fill in the forms of name and address and click on the add button. This way, a new
element in the "zone file" s added to resolve the concerned domain name. Finally, we must go to the desktop>IP configuration and paste the adequate IP address in the DNS server form.
This last operation must be done for every computer of the LAN.

# Step 8// Final test
To perform the final test, we can select a computer from the LAN and open the web browser tab. Then one should enter the url that was given in the "zone file" previously and press enter. If there are http packets that can be seen in the simulation, it means that we achieved a simulation of a connection to the interconnected network.

# * Additional notes *
As of scalability, this network architecture can welcome 21 more computers without any further expenses than Ethernet cables. If needed, the company could buy new switches and connect them to the existing one (daisy-chaining). Every new switch could make room for 23 new desktops. 




