# **Cisco Group Project**

We welcome everyone to this project! This project showcases the creation of a scalable, secure, and well-structured computer network tailored for various user groups, utilizing Cisco Packet Tracer.

### **Overview**

In this project, we developed a network for four distinct groups:
- **Management/Secretariat** ( 2 computers)
- **Study Group** (2 computers)
- **Production Group** (2 computers)
- **Support Group** (2 sectors, 2 computers each)
- **Servers** ( 3 Servers DHCP, DNS, ISCSI)

We implemented a mix of routers, switches, VLANs, and servers to ensure effective organization and communication among each group.


---

## **Network Summary**
**[Overview](https://github.com/Mohamedsaaidi/Cisco-Group-Project/tree/main/1%3A%20Overview)**
- Brief summary of the project

**[Network Diagram](https://github.com/Mohamedsaaidi/Cisco-Group-Project/tree/main/3%3A%20Network%20Equipment)**
- The Network Diagram

**[Network Equipment](https://github.com/Mohamedsaaidi/Cisco-Group-Project/tree/main/3%3A%20Network%20Equipment)**
- Routers
- Switches
- Servers

**[Estimated costs for the project](https://github.com/Mohamedsaaidi/Cisco-Group-Project/tree/main/4%3A%20Estimated%20Costs%20for%20the%20Project)**
- Costs of all Devices

**[Command and steps implemented in this process](https://github.com/Mohamedsaaidi/Cisco-Group-Project/tree/main/5%3A%20Command%20and%20Steps%20Implemented%20in%20this%20Process)**
- Commands


**[Security and Scalability](https://github.com/Mohamedsaaidi/Cisco-Group-Project/tree/main/6%3A%20Security%20and%20Scalability)**
- Overview of various security measures and their implementation


**[Contents](https://github.com/Mohamedsaaidi/Cisco-Group-Project/tree/main/7%3A%20Contents)**
- Cisco project .pkt file
- Presentation of the Project.pptx



## **Capabilities Overview**

1. **Virtual Local Area Networks** (VLANs) effectively isolate different user groups, allowing seamless communication only among members of the same group.
2. **Servers** Servers are powerful computers that provide data, services, or resources to other computers over a network. Goal: Their main goal is to manage, store, and deliver resources like files, applications, and websites to clients (user devices) as needed.
3. **Switches** Switches are networking devices that connect multiple devices within a local area network (LAN) and facilitate communication between them. Goal: Their primary purpose is to receive, process, and forward data to the appropriate devices, ensuring efficient data transmission within the network..
4. **The Router** Routers are devices that connect different networks together and route data packets between them. Goal: Their main goal is to direct data traffic between networks, allowing devices on different networks (like different VLANs or the internet) to communicate effectively.


## **Challenges Encountered**

- **Traffic Management**: We had to precisely configure both the router and switches to guarantee efficient data flow among the different groups.
- **DHCP Server Difficulties**: We encountered issues with our DHCP server because we did not use the IP address helper, which specifies the address for remote DHCP servers or relay agents. This feature allows the relay agent to forward DHCP requests to up to eight defined servers.
- **VLAN Setup**: Configuring and managing VLANs necessitated careful modifications to maintain proper separation and facilitate communication between groups.
- **Router Port Limitations**: We initially encountered constraints with the physical ports available on the router for all groups, prompting us to implement sub-interfaces to create virtual connections.
---

## **How To Use our Project**

1.**Obtain the Project File**: Clone or download the Packet Tracer file from this repository.
2.**Launch Cisco Packet Tracer**: Open the downloaded file in Cisco Packet Tracer.
3.**Examine the Network**: Review the configuration of the various VLANs and the connections facilitated by the router.
4.**Verify Communication**: Utilize the ping command between computers to see how they communicate within their VLANs and across VLANs through the router.

---

## **Our Group**

- **Mohamed** - Network design, configuration, and documentation
- **Alex** - Network design, configuration, and documentation
- **Nidhi** - Network design, configuration, and documentation

---

## **Future Enhancements**

- **Scalability**: The network can be readily extended by incorporating additional VLANs and user groups.
- **Enhanced Security**: We could deploy firewalls or more sophisticated access control lists (ACLs) to bolster security between VLANs.
- **Monitoring Solutions**: Implementing monitoring tools would enable us to track network performance and usage effectively.

---

