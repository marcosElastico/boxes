# What is Magento?
Magento Community Edition is open source eCommerce software used to power hundreds of thousands of online stores. It can be downloaded for free and is most frequently used by developers and small businesses.

The core code can be modified by developers and enhanced by installing application extensions from the Magento Connect marketplace.

# Description
This box installs and configures Magento using nginx and php-fpm boxes to run the application.

***

# Deployment Variables
|  Variable                  | Description                                                      | Value                 |
|----------------------------|------------------------------------------------------------------|-----------------------|
|   **SERVER_NAME** | Server name for nginx configuration |localhost|
|   **MAGENTO_VERSION** | Version of Magento to be installed |1.9.1.0|
|   **MAGENTO_CONF** | Nginx configuration file for serving Magento software| |
|   **MAGENTO_CONFIG** | Magento general configuration file | |
|   **MAGENTO_PATH** | Directory to install Magento |/opt/magento|
|   **http** | The port in which the Nginx will listen to|80|
|   **mysql** | Binding to a mysql server instance||
|   **nginx** | Nginx box variable||
|   **php** | PHP-FPM box variable||
|   **nfs** | NFS client box varible|||

***

# Deployment behavior
An instance executing this box will use bash scripting to install and configure Magento. It also stacks Nginx, PHP-FPM and NFS client boxes to support its complete behavior.  

Box events handle the Magento instance lifecycle as follows:

+ **Install** operation:
    * *install event script:* installs epel repository package, creates magento directory and changes its ownership to nginx.NGINX_USER and nginx.NGINX_GROUP.
+ **Configure** operation:
	* *configure event script:* downloads and configures the configuration's files (i.e. nginx.conf, local.xml) and saves them into nginx and magento directories respectively.

# Supported Distributions
The box supports deploying to these linux distributions:

* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7

***

# Documentation

Checkout Magento's [documentation](http://magento.com/help/documentation)
