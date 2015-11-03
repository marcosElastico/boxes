# What is Splunk universal forwarder?
The universal forwarder is Splunk's lightweight forwarder. Use it to gather data from a variety of inputs and forward the data to a Splunk Enterprise server for indexing and searching.

The universal forwarder's sole purpose is to forward data. Unlike a full Splunk Enterprise instance, you cannot use the universal forwarder to index or search data. To achieve higher performance and a lighter footprint, it has several limitations:

* It has no searching, indexing, or alerting capability.
* It does not parse data, except in certain cases.
* It does not output data via syslog.
* It does not include a bundled version of Python.

# Description
This box installs Splunk universal forwarder into the instance deployed using it.

***

# Deployment Variables
|  Variable             | Description                                                       | Default Value  |
|-----------------------|-------------------------------------------------------------------|----------------|
|   **indexer** 		| Port on which the Splunk universal forwarder will listen 			| 9997	         |
|   **management** 		| Http port on which the Splunk universal forwarder will listen		| 8089			 |
|   **INSTALLER** 		| Splunk universal forwarder's package url for download its installer| i.e. http://splunk.com/forwarder-xxx.tgz |
|   **PASSWORD** 		| Password of the user to manage the universal forwarder 			| elasticbox      |
|   **PATH_TO_MONITOR** | Path to logs folder to be monitored by Splunk universal forwarder  | i.e. /var/log/syslog |
|   **SOURCE_TYPE** 	| Name to associate with the type of data                            | i.e. SYSLOG   |
|   **RECEIVER** 		| Splunk Enterprise server's hostname or ip address to forward data  | i.e. 10.10.0.2 - not needed if receivers binding is provided - |
|   **receivers** 		| Splunk Enterprise server's binding to the instance to forward data | i.e. splunk-server - not needed if RECEIVER value (hostname or ip) is provided - |

***

# Deployment behavior
An instance executing this box will use bash scripting to download, install and configure a Splunk universal forwarder. 

Box events handle the Splunk uf instance lifecycle as follows:

+ **Install** operation:
    * *pre_install event script:* downloads and installs the correct release of Splunk uf in the instance.
+ **Configure** operation:
	* *configure event script:* sets the new password, enables Splunk uf to start after boot, configures Splunk uf to listen to indexer port variable,
    adds all matched instances returned by receivers binding as forwarder servers or the RECEIVER hostname or ip address if provided, list the forwarder servers, 
    and finally adds a monitor to PATH_TO_MONITOR location of the desired SOURCE_TYPE.
+ **Start** operation:
	* *pre_start event script:* restarts Splunk uf service.
+ **Stop** operation:
	* *pre_stop event script:* stops Splunk uf service.

# Supported distributions
This deployment supports these Linux distributions:

* Ubuntu 14.04
* Red Hat Enterprise Linux on Amazon EC2

***

# Documentation
Checkout Splunk's [documentation](http://docs.splunk.com/Documentation).
