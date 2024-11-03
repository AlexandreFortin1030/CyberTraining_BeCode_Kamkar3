# Network Configuration Guide

## Step 2: VLAN Segmentation

### VLANs:
- **VLAN 10**: Management/Secretariat
- **VLAN 20**: Study
- **VLAN 30**: Production
- **VLAN 40**: Support 1
- **VLAN 41**: Support 2
- **VLAN 50**: DMZ
- **VLAN 1**: Servers

## Step 3: IP Addressing Scheme

### Subnetting:
- Each VLAN should have its own subnet.
- Example:
  - **VLAN 10**: 192.168.10.10
  - **VLAN 20**: 192.168.20.10
  - **VLAN 30**: 192.168.30.10
  - **VLAN 40**: 192.168.40.10
  - **VLAN 41**: 192.168.41.10
  - **VLAN 50**: 192.168.50.10
  - **VLAN 1**: 192.168.1.1

## Step 4: Check the Connectivity
- Ensure Ethernet cables are plugged in securely on all computers and the router/switch.
- Use the following commands to display IP address, subnet mask, and default gateway:
  - **Windows**: `ipconfig`
  - **Mac OS and Linux**: `ifconfig` or `ip addr show`
- Test connectivity to your router using the `ping` command:
  ```bash
  ping <router IP>

  ### Commands for VLAN Configuration on a Switch

```bash
Switch>
Switch> enable
Switch# config terminal
Switch(config)# vlan X
Switch(config-vlan)# name Abc
Switch(config-vlan)# interface range FastEthernet0/1-FastEthernet0/8
Switch(config-if-range)# switchport access vlan X

- **On Multilayer Switch(Interface from Multilayer to Access Switch)**:
bash
Copy code
Switch> enable
Switch# config terminal
Switch(config)# interface FastEthernet0/0
Switch(config-if)# switchport trunk encapsulation dot1Q
Switch(config-if)# switchport mode trunk
Switch(config-if)# exit
Switch# config terminal
Switch(config)# vlan X
Switch(config-vlan)# name Abc
Switch(config-vlan)# interface vlan X
Switch(config-vlan)# ip address 192.168.X.1 255.255.255.0
Switch(config-vlan)# no shut
exit

- **IP Routing**
bash
Copy code
# Interface vlan 30
# ip helper-address 192.168.1.2
- ** On Router with Connected Interface**:
bash
Copy code
# interface fa0/0 (the interface name)
# switchport mode trunk
# switchport trunk allowed vlan 
