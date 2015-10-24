# What is Nginx?
Nginx is a high-performance HTTP and reverse proxy server, a mail proxy server, and a generic TCP proxy server written originally by Igor Sysoev.

# Description
This box installs and configures Nginx to behave as an HTTP/HTTPS server.

***

# Deployment Variables
|  Variable                  | Description                                                      | Value                 |
|----------------------------|------------------------------------------------------------------|-----------------------|
|   **PUBLIC_SSL_CERTIFICATE** | Public SSL certificate | |
|   **PRIVATE_SSL_KEY** | Private SSL key | |
|   **NGINX_CONF** | Nginx general configuration file | |
|   **NGINX_USER** | The name of the user that will own nginx cache, logs and certificates directories|root|
|   **NGINX_GROUP** | The name of the user's group that will own nginx cache, logs and certificates directories|root|
|   **LOG_PATH** | Folder where nginx logs are stored|/var/log/nginx|
|   **CACHE_PATH** | Folder where nginx cache is stored|/var/nginx/cache|
|   **CERTIFICATE_PATH** | Folder where nginx certificates are stored|/var/nginx/certificates||


***

# Deployment behavior
An instance executing this box will use bash scripting to install and configure nginx. 

Box events handle the nginx instance lifecycle as follows:

+ **Install** operation:
    * *install event script:* installs nginx package in the instance using the correct package manager.
+ **Configure** operation:
	* *configure event script:* downloads and configures the configuration's files (i.e. nginx.conf), creates the logs, cache and certificates directories and changes its ownership to NGINX_USER and NGINX_GROUP. Finally installs public ssl certiticate and private ssl key into certificates directory.
+ **Start** operation:
	* *start event script:* checks for nginx process and if it does not found it runs nginx.
+ **Stop** operation:
	* *stop event script:* checks for nginx process and if it founds it, kills nginx process.

# Supported Distributions
The box supports deploying to these linux distributions:

* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

# Documentation

For more information, see the Nginx [documentation](http://nginx.org/en/docs/).
