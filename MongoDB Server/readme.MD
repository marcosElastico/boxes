# What is MongoDB?
MongoDB (from humongous) is a cross-platform document-oriented database. Classified as a NoSQL database, MongoDB eschews the traditional table-based relational database structure in favor of JSON-like documents with dynamic schemas (MongoDB calls the format BSON), making the integration of data in certain types of applications easier and faster. Released under a combination of the GNU Affero General Public License and the Apache License, MongoDB is free and open-source software.

# Description
This box installs a MongoDB Server and starts its services.

***

# Deployment Variables
*   **username**: Name of the admin user
*   **password**: Password of the admin user
*   **VERSION**: Version to install [2.6.1 by default]
*   **DB_PATH**: Path where MongoDB will install [the path is set to default]
*   **LOG_PATH**: Path where MongoDB will store the logs [the path is set to default]
*   **mongodb**: Port that allows mongod and mongos instances to communicate [27017 by default]

***

# Deployment behavior
An instance executing this box uses Puppet and Bash scripting to download, install, and configure MongoDB. Box events handle the MongoDB instance lifecycle as follows:

+ **Install** operation:
    * *github pre_install*: Disables the strict host verification for github.com.
    * *github.gitrepo pre_install*: Installs Git with rpm or apt-get.
    * *puppet pre_install*: Installs the selected version of Puppet.
+ **Configure** operation:
	* *github.gitrepo pre_configure*: Looks for the repository folder. If present, it updates it to the latest. If not, it clones the repository of the MongoDB Puppet recipe into the target folder.
	* *puppet pre_configure*: Downloads and configures common.yaml, puppet.conf, hiera.yaml with the deployment variables values and saves them in their default location: /etc/puppet/. Then it applies the Puppet recipe and overrides the exit code 2 to indicate no changes to Puppet. The Mongodb Puppet recipe will download the specified MongoDB version, install and ensure that the service is running.

# Supported Linux distributions
The box supports deploying to these linux distributions:
* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

# Documentation
For more information, see the MongoDB documentation at http://docs.mongodb.org/manual/.

***

# License
```
Most MongoDB source files (src/mongo folder and below) are made available under the terms 
of the GNU Affero General Public License (AGPL).  See individual files for details.

As an exception, the files in the client/, debian/, rpm/, utils/mongoutils, and all 
subdirectories thereof are made available under the terms of the Apache License, version 2.0.

```
