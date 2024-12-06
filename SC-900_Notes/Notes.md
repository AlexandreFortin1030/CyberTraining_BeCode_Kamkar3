# Notes for SC-900 Certification

## I/ Describe Security and Compliance Concepts
-> Intro: As more and more businesses data is accessed from outside of the primary coporate network, security and compliance have become increasingly important.

## A/ Shared responsability model
In organization that are using cloud based services, the responsability of securing data access is shared between the company and the cloud provider. On the contrary, copanies that are running their own hardware are 100% reponsible for their own security and compliance.
The shared security model shows what aspects of these responsabilities are held by the client and which by the service provider.Obviously, this depends on the kind of service that is being provided:
![My Local Image](./Pictures/1.png)
SaaS: Software as a service;
PaaS: Platform as a Service
IaaS: Infrastucture as a service
On-premises datacenter : Hardware is localy managed.

## B/ Describe defence in depth 
Defence in depth uses a layered approach to security, so then if one of these layers is breached, there's the next one to slow down or stop the attacker. 

![My Local Image](./Pictures/2.png)

* CIA triangle
![My Local Image](./Pictures/3.png)
* Confidentiality, is keeping the data confidential.
* Integrity, is keeping the data unchanged or unaltered, making sure it remains as it is since the begining.
* Availability, refers to data being available or accessible whenever needed.

->Non repudiation: It ensures that no party can deny that it sent or received a message.

## C/ Describe Zero Trust model
-> Zero trust model always assumes the worst scenario."Trust no-one, verify everything".
* The following principles are emphasized:
   * Verify identity: Authentication and authorization are rigorously applied to all users and devices.
   * Least priviledge principle
   * Micro-segmentation: Network ressources are divided into smaller segments to limit lateral movement.
   * Continuous monitoring
   * Data encryption
   * Strict access control: based on context (user roles, device health, network location)

## D/ Common  threats
* Threat = Any potential danger.
-> Phising
-> Malware
-> SQL injection
-> XSS ...
* Vulnerability = A soft/weak spot in the defence infrastructure.
* Risk = Threat combined with vulnerability.

####  MITRE ATT&CK framework:
-> A framework develloped by MITRE that provides a standardized way to describe and analyze cyber threats.
* Understanding Adversarial Behavior.
* Plan and implement defence strategies.
* Incident response and threat hunting.
![My Local Image](./Pictures/4.jpeg)


## E/ Understanding risk management
* Threat = Any potential danger.
* Threat agent = malicious entity
* Vulnerability = A soft spot in the defence infrastructure.
* Risk = The potential for loss or damage resulting from the combination of threat and vulnerability.
* Asset = Anything of value.
* Exposure = The state of being vulnerabe to potential threats.
* Control = A mesure put in place to reduce the risk associated with vulnerabilities and threats.

#### Types of security controls:

* Administrative controls:
   * Security policies
   * Security awareness and training
   * Incident response management

* Technical controls:
   * Access control: restrict user access to ressources based on their roles and permissions.
   * Encryption: converting data into a secure format
   * Firewalls: network security devices that filters traffic
   * Intrusion Detection and Prevention Systems IDPS: Tools that monitor network traffic for suspicious activity.
   * Antivirus/Anti-malware software: Programs that detects and removes malicious softwares.
   * Authentication mechanism: method for verifying identity of a user.
   * Patch management: Regularly updating software to address known vulnerabilities.

* Physical controls:
   * Security guards
   * Surveillance cameras
   * Locks and physical barriers

* Legal and regulatory controls:
   * Data protection regulations
   * Industry-specific standrads

#### Assessing security risks
* Identify Assets and threats
* Assess vulnerabilities
* Likelyhood assessment
* Impact assessment
* Risk calculation
* Risk treatment
* Continuous monitoring and review

## F/ Security practices and documentation
* Security policy: A high-level document that outlines an organizations security goals, principles and guidelines.
* Security standards: A more detailed and specific document that provides guidelines and requirement for implementing security comtrols and measures within an organization.
* Security baseline: A set of minimum security config that is considered essential for a particular system.
* Security guideline: A document that deals with "grey area" when no standards apply to a specific situation.
* Security procedure: A detailed step by step guide of actions to apply.
* Laws and regulations: legal security frameworks established by governments and regulatory bodies.


## II/ IAM 

## A/ Key concepts:
#### Identity and access management (IAM)
* A set of proccesses, techs and policies that aims to make sure that the right individuals have the appropriate access to ressources within an organization's digital environnement. It aims to enhance security as well as streamline user access.

#### Principle of least priviledge
* Granting users and systems only the minimum priviledges necessary to perform the tasks they are intended to.

#### Segregation of duties
* distrubuting critical tasks and rsponsabilities in a way that prevent conflicts of interest and fraud

#### Authentication and authorization
* Authentication is verifying the identity of a user, system or entity trying to access a ressource. it can be based on something you know, something you have, something you are.

* Authorization is the process of granting or denying permissions or priviledges to and authenticated user or entity.

## B/ Zero trust architecture:
-> Identity is a key part of implmenting a zero trucst architecture and building a perimeter far any IT environnement.
![My Local Image](./Pictures/5.pgn)

#### Why Identity as a perimeter?
In modern IT environments, especially since the rise of cloud services and remote work, the traditional security perimeter (doors, firewalls etc) is no longer the go to. Instead security nowadays revolves around  verifying and managing the identity of users, devices and applications attempting to access ressources, regardless of their physical location.

#### Differences with traditionnal architectures:
![My Local Image](./Pictures/6.pgn)

#### Identity used ti implement zero trust architecture:
* In a zero trust architecture, the fundamental principle is to nerver automatically trust any entity, regardless of wether it is inside or outside the network perimeter. This involves verifying their digital identity through methods such as username/password combo, MFA, biometrics and other strong authentication methods.

## C/ Capabilities :
-> Core tools and capabilities used in identity security
![My Local Image](./Pictures/7.pgn)
#### Directory service
A directory service is a database that stores and manages information about network ressources including users, groups, devices, apps... It is used as a central repository of identity and access related data. It provides a foundation for Identity and Access Management solutions (IAM).
Key featurures:
* User authentication: Directory services validate user credentials to ensure only authorized users can access the networks and its ressources.
* User Authorization: Determines the level of access each user has according to their roles, group membership and other attributes.
* Group management: Permissions can be assigned to groups rather that only to individual users.
* Password policies: Enforcing password complexity and expiration rules.
* Single Sign-on(SSO):Enables users to access multple applications and services through a single set of credentials.
* Centralized user management
* Auditing and logging

#### Capabilities that can be used to secure identities?
* MFA
* Single Sign-on (SSO): reduces the risk of managing multiple passwords.
* Role based access control: Users are granted access based on their roles within an organization.
* Adaptive authentication: Adjusts dynamically the level of authentication required based on the user behavior, location, device etc.
* Biometric authentication
* Priviledged Access Management: Focuses on securing access to critical systems and data with Just-In-Time access and session monitoring.
* Behaviorale Analitycs: Monitors user behavior and establishes baseline patters. Deviation from the norm can trigger alerts for further inverstigations.


## III/ Networking







## IV/ SecOps
## V/  AppSec
## VI/ Infrastucture security
## VII/ Data security
## VIII/ AI security
