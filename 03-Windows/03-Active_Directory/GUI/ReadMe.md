
![alt text](./Pictures/AD.png) 


# I/ System preparation

For this project, I need to configure 3 virtual machines (client, windows server 2022 and a domain controller) using VirtualBox.
Since my machine has 8 CPUs and 16GB of RAM, I chose to run only 2 VMs; One for the client and one with the server and domain controller.

I will allocated ressources as follow:

-> Server + Domain Controller: 3 CPU, 6GB RAM

-> Client: 2 CPU, 4GB RAM

-> Local Machine: 3CPU, 6GB RAM

# II/ Active Directory setup

## A/ Add Roles and Features

* Once the installation is done, we get to the main menu of the server manager:
![alt text](./Pictures/2.png)

* Then click:

  * Add roles and features

  * Role-based or feature-based installation


## B/ Install Active Directory Domain Services (AD DS)


* And we select our own server:
![alt text](./Pictures/3.png)

  * Select server roles

  * Active Directory Domain Services

  * Add features

  * Click next until the instalation sumup

* Click install 

![alt text](./Pictures/4.png)

![alt text](./Pictures/5.png)


## C/ Promote the Server to a Domain Controller

* After closing the install window, go back to the dashboard and click on the flag
![alt text](./Pictures/6.png)
An then on "Promote this server to a domain controller"


* Int the deployment configuration window 
  * Add a new forest
Then enter a root domain name like "example.local" and click next.
![alt text](./Pictures/7.png)

* Leave the values to default but enter a Directory Services Restore Mode password.
* If prompted about DNS delegation, you can ignore it for now and click Next.
![alt text](./Pictures/8.png)
* As the NetBios Domain Name will be auto-generated based on your domain name, you can also click Next.
![alt text](./Pictures/9.png)
* Also click Next for the Path window 
* Review your selection and click Next
* The wizard will then make sure that all prerequisites are met and proceed to install.

## D/ Configure DNS service
* After completing restart, clik on "Tool" in the top right corner and select DNS.
* In DNS manager, expand the server node and check if the "forwrd lookup zones" folder contains our domain name (example.local).
If so, it shows the DNS is configured properly.
![alt text](./Pictures/10.png)

## E/ Create Organizational Units (OU)
* In Server Manager, click on "Tools" and select "Active Directory Users and Computers"
* Right-click on our domain name, select "new" and "Organizational Unit"
![alt text](./Pictures/11.png)
* Create two OU, one called "Admins" for Alice's profile and a second one called "StandarUsers" for Bob.

## F/ Confirm Domain Membership
* Navigate to "Settings", "System", "About", "advanced system settings".
* Under the "Computer name" tab, check for computer name and domain name. If it doesn't contain your example.local, you have to add it.
![alt text](./Pictures/12.png)

## F/ Configure Server Roles
* Install and configure IIS
  * Open Server manager. Click on "Manage", "Add roles and features" and follow the wizard to install Web Server IIS role.
  ![alt text](./Pictures/13.png)

# III/ Connecting Client and Server

## A/ Connect VMs

* Start both VMs.
* in cmd, run the following command:
  * -> ipconfig
  ![alt text](./Pictures/server.png)
* Check if both internal adapter (both VMs should have one) are on same subnet.
* Try to ping the server with the client.
  ![alt text](./Pictures/client.png)
Vms are connected.

## D/ Setup static IP for server's internal network adapter
* Go to "Control panel", "Network and internet", "Network and sharing center", "Change adapter settings".
* Right click on the internal network interface (ethernet 2 in this case)and select "Properties".
* select "internet protocol version 4", and click "Properties".
* 


## C/ Setup DHCP on server
* From the Server Manager dashboard go to "Manage", "Add roles and features", "Role based or feature based installation".
* Then select DHCP in the list and proceed to installation.
![alt text](./Pictures/14.png)
* Now let's configure the DHCP. In the server manager, click on the DHCP on the left. Then right click on the server and choose "DHCP manager".
![alt text](./Pictures/15.png)
![alt text](./Pictures/16.png)
* From this point unfold the server on the left, click on "ipv4" and on the right of the window click on "more actions". Then select "New scope".
![alt text](./Pictures/17.png)
* In the wizard, I call it "ClientNetwork".




# IV/ Join Client VM to the Domain
* So now we will take the same steps already taken at II/F with the server but on the client VM.
