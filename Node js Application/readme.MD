# What is Node.js Application?
Node.js® is a platform built on Chrome's JavaScript runtime for easily building fast, scalable network applications. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient, perfect for data-intensive real-time applications that run across distributed devices.

# Description
This box deploys an application based on Node.js and starts it using forever

***

# Deployment Variables

The following variables can be modified at deployment time

|  Variable                  | Description                                                      | Default Value                         |
|----------------------------|------------------------------------------------------------------|---------------------------------------|
|  APP_ENTRY_POINT           |  Application Entry point file to be started using forever        | i.e. app.js                           |
|  APP_FOLDER                |  Directory where the Application Repository will be cloned       | i.e. NodeApp                          |
|  port                      |  The port number to use when listening for HTTP connections.     | 8080                                  |
|  github.git_repo.CLONE_URL |  Repository's url with the source code of Node.js Application    | i.e. https://github.com/you/app.git 	|

***

# Deployment behavior
An instance executing this box will use bash scripting to download, install and configure a Node.jsiversal forwarder. 

Box events handle the Node.js instance lifecycle as follows:

+ **Install** operation:
    * *pre_install event script:* updates the package's index using the correct package manager.
    * *github:* installs git package.
    * *install event script:* installs nodejs package's source.list if needed and installs Node.js in the instance.
+ **Configure** operation:
	* *github:* clones the repository with the Node.js application.
	* *configure event script:* runs npm install and configures the application's entry point file (i.e. app.js) running elasticbox's config command to replace if present with instance's variables values.
+ **Start** operation:
	* *pre_start event script:* checks for previous forever processes of the node.js application and if some is running it runs forever stopall and then it uses forever to start Node.js application using its entry point.

# Supported distributions
This deployment supports these Linux distributions:

* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

# Documentation
Checkout Node.js [documentation](https://nodejs.org/documentation/).