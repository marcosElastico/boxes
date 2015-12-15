# What is Puppet?
Puppet is an open source systems management tool for centralizing and automating configuration management.

# Description
This box allows you to include legacy puppet's modules and manifests into your Application Catalog within ElasticBox. Installs Puppet and runs it to apply the modules, manifests and configurations defined by the box variables.

***

# Deployment Variables
*   **MODULES_DIRECTORY**: Path of the directory that stores the puppet modules. Modules are self-contained bundles of code and data
*   **PUPPET_DEFAULT**: Manifest file (default.pp) that serves as the entrypoint for the Puppet run
*   **HIERA_PATH**: Path to the Hiera's data configuration directory on the instance
*   **HIERA_COMMON**: Instance non-specific configuration file (Common.yaml)
*   **PUPPET_CONF**: Puppet configuration file (Puppet.conf) that uses Puppet agent
*   **HIERA_YAML**: Instance specific configuration file (Hiera.yaml)

***

# Deployment behavior
An instance executing this box will use puppet and bash scripting to download, install and configure Puppet. Box events handle the Puppet lifecycle on the instance as follows:

+ **Install** operation:
    * *pre_install event script:* downloads and installs the correct release of puppet agent in the instance.
+ **Configure** operation:
	* *pre_configure event script:* downloads and configures common.yaml, puppet.conf, hiera.yaml with the variables's values and saves them into their default location: /etc/puppet/. Then it applies the puppet modules or manifests and overrides the exit code 2 that means no changes for puppet.

# Supported Distributions
The box supports deploying to these linux distributions:
* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

# Documentation
Checkout Puppet's documentation at https://docs.puppetlabs.com/

***

# License
```
Puppet is open source and is released under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0.html).

Versions prior to Puppet 2.7.0 and Facter 1.6.0 were released under the GPL version 2.0 license.
```
