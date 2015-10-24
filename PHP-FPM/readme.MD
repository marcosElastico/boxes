# What is PHP-FPM?
PHP-FPM (FastCGI Process Manager) is an alternative PHP FastCGI implementation with some additional features useful for sites of any size, especially busier sites.

These features include:

* Adaptive process spawning
* Basic statistics (ala Apache's mod_status)
* Advanced process management with graceful stop/start
* Ability to start workers with different uid/gid/chroot/environment and different php.ini (replaces safe_mode)
* Stdout & stderr logging
* Emergency restart in case of accidental opcode cache destruction
* Accelerated upload support
* Support for a "slowlog"
* Enhancements to FastCGI, such as fastcgi_finish_request() - a special function to finish request & flush all data while continuing to do something time-consuming (video converting, stats processing, etc.)

# Description
This box installs the PHP programming language, as well as an Apache server to run it.

***

# Deployment Variables
|  Variable                  | Description                                                      | Default Value         |
|----------------------------|------------------------------------------------------------------|-----------------------|
| **PHP_USER** | The name of the user that will own PHP-FPM logs directory. |root|
| **PHP_GROUP** | The name of the user's group that will own PHP-FPM logs directory. |root|
| **LOGS_DIRECTORY** | Folder where php-fpm logs are stored |/var/log/php-fpm |
| **PHP_FPM_CONF** | PHP's configuration file (php.ini) | |
| **PHP_FPM_CONF** | PHP-FPM's configuration file (www.conf) | | |

***

# Deployment behavior
An instance executing this box will use bash scripting to install and configure a PHP-FPM. 

Box events handle the PHP-FPM instance lifecycle as follows:

+ **Install** operation:
    * *install event script:* installs PHP-FPM and its needed packages (php-mysql, php-pear, php-bcmath, php-common, php-gd, php-pdo, php-pdo-mysql, php-mcrypt) in the instance using yum package manager.
+ **Configure** operation:
	* *configure event script:* downloads and configures the configuration's files (i.e. php.ini and www.conf), creates the logs directory and changes its ownership to PHP_USER and PHP_GROUP.
+ **Start** operation:
	* *start event script:* checks for php-fpm process and if it does not found it runs PHP-FPM as a daemon.
+ **Stop** operation:
	* *stop event script:* checks for php-fpm process and if it founds it, kills PHP-FPM process.


# Supported distributions
This deployment supports these Linux distributions:

* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
