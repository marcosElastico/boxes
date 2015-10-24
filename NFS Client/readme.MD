# What is NFS Client?
Network File System (NFS) is a distributed file system protocol originally developed by Sun Microsystems in 1984, allowing a user on a client computer to access files over a network much like local storage is accessed. NFS, like many other protocols, builds on the Open Network Computing Remote Procedure Call (ONC RPC) system. The Network File System is an open standard defined in RFCs, allowing anyone to implement the protocol.

# Description
This box installs and configures a NFS Client.

***

# Deployment Variables
| Variable         | Description                                         | Value             |
|------------------|-----------------------------------------------------|-------------------|
| LOCAL_PATH       | Mounting Directory                                  | /usr/local/pub    |
| server           | Binding to NFS Server                               | <select instance> |

***

# Deployment behavior

Box events handle the NFS Server instance lifecycle as follows:

+ **Install** operation:
    * *install event script:* installs nfs package in the instance using the correct package manager.

+ **Configure** operation:
	* *configure event script:* configures the configuration's files

# Supported Distributions
The box supports deploying to these linux distributions:

* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

For more information, see the [Linux Documentation Project](http://www.tldp.org/HOWTO/NFS-HOWTO/server.html)