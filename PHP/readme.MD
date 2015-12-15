# What is PHP?
PHP is a scripting language, created by Rasmus Lerdorf in 1994, which was designed for web development but can also be used as a general-purpose programming language.

# Description
This box installs the PHP programming language, as well as an Apache server to run it.

***

# Deployment Variables
*   **http**: Port to be used for HTTP connections [80 as default value]
*   **https**: Port to be used for HTTPS connections [443 as default value]
*   **github.git_repo.CLONE_URL**: Git repository URL that contains the necessary Puppet code to install PHP [https://github.com/ElasticBox/php.git as default value]
*   **github.git_repo.CLONE_DIRECTORY**: Directory where the repository will be cloned [/etc/puppet/modules/php as default value]
*   **github.git_repo.BRANCH**: Git branch that will be cloned. [master as default value]
*   **puppet.MODULES_DIRECTORY**: Path of the directory that stores the puppet modules. Modules are self-contained bundles of code and data
*   **puppet.PUPPET_DEFAULT**: Manifest file (default.pp) that serves as the entry point for the Puppet run
*   **puppet.HIERA_PATH**: Path to the Hiera's data configuration directory on the instance
*   **puppet.HIERA_COMMON**: Instance non-specific configuration file (Common.yaml)
*   **puppet.PUPPET_CONF**: Puppet configuration file (Puppet.conf) that uses Puppet agent
*   **puppet.HIERA_YAML**: Instance specific configuration file (Hiera.yaml)

***

# Deployment behavior
An instance executing this box will use Puppet and Bash scripting to download, install and configure PHP. Box events handle the PHP instance lifecycle as follows:

+ **Install** operation:
    * *github.pre_install*: Disables the strict host verification for github.com.
    * *github.git_repo.pre_install*: Installs the git package with the correct package manager for the Linux distribution (rpm or apt-get).
    * *puppet.pre_install*: downloads and installs the correct release of the Puppet agent in the instance.
+ **Configure** operation:
    * *github.git_repo.pre_configure*: Clones the repository containing all the necessary Puppet configuration.
    * *puppet.pre_configure*: downloads and configures common.yaml, puppet.conf, hiera.yaml with the variables's values and saves them into their default location: /etc/puppet/. Then it applies the Puppet modules and manifests necessary to install the Apache server and PHP.

# Supported distributions
This deployment supports these Linux distributions:

* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

# Documentation
For more information, see PHP's [documentation](http://php.net/docs.php).
