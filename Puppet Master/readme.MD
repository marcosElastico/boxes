# What is Puppet?
Puppet is an open source systems management tool for centralizing and automating configuration management.

# Description
This box installs a Puppet master to serve modules to be used by other instances which have Puppet agent installed in them. 

***

# Deployment Variables
|  Variable                  | Description                                                      | Value                 |
|----------------------------|------------------------------------------------------------------|-----------------------|
|   **MASTER_DNS_NAME** | Automatically set with the instance's hostname						| will be overwriten by box behavior |
|   **PUPPET_CONF** | Puppet configuration file (Puppet.conf) that uses puppet master | |
|   **SITE_PP** | Puppet site configuration file for puppet master | |
|   **MODULES_DIRECTORY** | Modules directory for puppet master to serve | |
|   **modules** | GitHub box used to clone the puppet modules into the modules directory from a github repository | |
|   **modules.git_repo.CLONE_URL** | The url of the github repository with the puppet modules | |
|   **modules.git_repo.CLONE_DIRECTORY** | The target folder to clone the git repository | default is {{MODULES_DIRECTORY}} variable's value referenced with Jinja syntax |
|   **modules.git_repo.BRANCH** | The branch of the github repository with the puppet modules | master |

***

# Deployment behavior
An instance executing this box will use bash scripting to download, install and configure a Puppet master server. 
This box is to be used in an Agent/Master setup which consists of a central Puppet Master server, where all of your configuration data(modules) will be managed and distributed from, and all your remaining servers will be Puppet Agent nodes, which can be configured by the puppet master server. 

Box events handle the Puppet master instance lifecycle as follows:

+ **Install** operation:
    * *pre_install event script:* downloads and installs the correct release of puppet master in the instance.
    * *modules.git_repo.pre_install event script:* installs the git package with the correct package manager for the linux distribution (rpm or apt-get).
+ **Configure** operation:
	* *pre_configure event script:* downloads and configures puppet.conf and site.pp with the variables's values and saves them into their default location: /etc/puppet/.
	* *modules.git_repo.pre_configure event script:* checks for an existing CLONE_DIRECTORY folder. If not it clones the repository of the CLONE_URL into the CLONE_DIRECTORY folder. If it exists, reset the remore url, branch and pulls latest code of the puppet modules.
+ **Start** operation:
	* *pre_start event script:* restart puppetmaster service.

# Supported distributions
This deployment supports these Linux distributions:

* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

# Documentation
Checkout Puppet's [documentation](https://docs.puppetlabs.com).

***

# License
```
Puppet is open source and is released under the Apache 2.0 License.

Versions prior to Puppet 2.7.0 and Facter 1.6.0 were released under the GPL version 2.0 license.

```
