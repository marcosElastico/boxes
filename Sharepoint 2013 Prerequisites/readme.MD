# What is Sharepoint 2013 Prerequisites?
Sharepoint 2013 Prerequisites is a powershell script box that gathers and install all the Sharepoint 2013 Prerequisites needed for Sharepoint 2013. 
It uses an NFS mount to copy all its needed files locally to avoid using the Internet bandwidth to download them for every need node for the farm.

# Description
This box installs and configures Sharepoint 2013 Prerequisites.

***

# Variables Usage
|  Variable            | Description                                            | Value             |
|----------------------|--------------------------------------------------------|-------------------|
| **NFS_DRIVE_LETTER** | Drive letter of the NFS mount                          | S                 | 
| **CONFIGURATION**    | Configuration file needed by prerequisites installer   | config.xml       ||

***

# Deployment behavior
An instance executing this box will use powershell scripting to copy from an NFS mounted dirve, install and configure Sharepoint 2013 Prerequisites.

# Supported Distributions
The box supports deploying to these windows versions:

* Windows Server 2012
* Windows Server DC 2012

***