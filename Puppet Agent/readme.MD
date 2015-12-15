# What is Puppet?
Puppet is an open source systems management tool for centralizing and automating configuration management.

# Description
This box installs Puppet agent that connects with a puppet master and runs the modules and manifests retrieved from the master.

***

# Deployment Variables
|  Variable                  | Description                                                      | Value                 |
|----------------------------|------------------------------------------------------------------|-----------------------|
|   **master** | Binding to puppet master server for puppet agent to connect with				| i.e. puppet-master
|   **PUPPET_CONF** | Puppet configuration file (Puppet.conf) that uses puppet agent | |
|   **PUPPET_FACTER** | Facter shell script to load box's variables into puppet environment | | |

***

# Deployment behavior
An instance executing this box will use bash scripting to download, install and configure a Puppet agent and do a puppet run of the required modules retrieved from the puppet master server (binding master - selected instance at deployment time), acording to the puppet agent instance's name and the clases defoned in the master. This box is intended to be used in an Agent/Master setup which consists of a central Puppet Master server, where all the configuration data (modules and manifests) will be managed and distributed from, and all your remaining instances will be Puppet Agent nodes, which can be configured by the puppet master server. 

Box events handle the Puppet Agent instance lifecycle as follows:

+ **Install** operation:
    * *pre_install event script:* downloads and installs the correct release of puppet agent in the instance.
+ **Configure** operation:
	* *pre_configure event script:* downloads and configures puppet.conf and facter.sh with the variables's values and saves them into their default location: /etc/puppet/ and /etc/facter/facts.d/, and change facter.sh persmissions allowing to be executed. Starts puppet agent to run the modules, manifests obtained from the puppet master having available all the box's variables injected by the facter.sh in the puppet's environment.

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
