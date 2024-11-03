# Network Equipment Configuration Guide

## Overview

This document outlines the network equipment used in our infrastructure, detailing each device's model and purpose. This configuration is designed to optimize performance and ensure seamless connectivity within the network.

## Network Devices

### 1. Router
- **Model**: Cisco ISR 4331
- **Purpose**: 
  - Provides routing between VLANs.
  - Facilitates internet connectivity.
  - Offers built-in firewall capabilities to enhance security.

### 2. Multilayer Switch
- **Model**: Cisco 3560
- **Purpose**: 
  - Handles inter-VLAN routing, allowing different VLANs to communicate.
  - Connects to the router and other switches to manage traffic efficiently.

### 3. Switches
- **Model**: Cisco 2960 (6 units)
- **Purpose**: 
  - Provides Layer 2 connectivity for workstations and servers.
  - Supports VLAN segmentation to improve network management.

### 4. Workstations
- **Total**: 10 computers
- **Purpose**: 
  - User endpoints for various functions including:
    - Management
    - Study
    - Production
    - Support1
    - Support2

### 5. Servers
- **Total**: 3 servers
- **Functions**:
  - **DNS Server**: Resolves domain names within the network, facilitating easier access to resources.
  - **DHCP Server**: Dynamically assigns IP addresses to devices, ensuring efficient IP management.
  - **iSCSI Storage Server**: Provides networked storage solutions, enabling centralized data access and management.

## Conclusion

This configuration of network devices is designed to ensure a robust and efficient network environment. Regular maintenance and monitoring of these devices are essential for optimal performance and security. 


