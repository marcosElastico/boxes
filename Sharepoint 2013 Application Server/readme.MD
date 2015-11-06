# What is Sharepoint Application Server 2013?
Sharepoint 2013 Application Server is a composed powershell script box that installs Sharepoint 2013 application services and uses a Microsoft SQL Server binding for create or connect to the Sharepoint 2013 database. 
This box uses Sharepoint 2013 Prerequisites box for preparing the windows instance for the installation of Sharepoint 2013.

Organizations use SharePoint to create websites and as a secure place to store, organize, share, and access information from almost any device. 

# Description
This box installs and configures Sharepoint 2013 Application Server.

***

# Variables Usage
|  Variable            | Description                                             | Value             |
|---------------------------|----------------------------------------------------|-------------------|
| **ADMIN_CONTENT_DB_NAME** | Admin Content Dabase Name to be used by Sharepoint | SP_AdminContentDB |
| **CONFIG_DB_NAME**        | Configuration Dabase Name to be used by Sharepoint | SP_ConfigDB       |
| **DB_ACCOUNT**            | System Administrator account name with permissions over database | sa  |
| **DB_ACCOUNT_PASSWORD**   | System Administrator account password              | ********          |
| **FARM_ACCOUNT**          | Domain Administrator account name with domain      | EBX\Administrator | 
| **FARM_ACCOUNT_PASSWORD** | Domain Administrator account password              | ********          |
| **FARM_PORT**             | Sharepoint Management Portal port number           | 8082              | 
| **PASSPHRASE**            | Sharepoint Passphrase                              | ********          |
| **CONFIG_DB_ACTION**      | Choose to CREATE or CONNECT to existent database   | CONNECT           | 
| **database**              | Binding to the database server of type SQL Server 2014|               ||

***

# Deployment behavior
An instance executing this box uses Sharepoint 2013 Prerequisites box to copy from an NFS mounted drive the image of Sharepoint 2013 DVD, mounts the ISO file, 
installs the prerequisites and then uses powershell scripting to configure Sharepoint 2013 with all the application server needed services. 
It also takes care of the creation or simple connection to an already exixtent Sharepoint 2013 database, depending on the option selected in the CONFIG_DB_ACTION option variable.

# Supported Distributions
The box supports deploying to these windows versions:

* Windows Server 2012
* Windows Server DC 2012

***
