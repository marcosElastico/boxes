# What is Couchbase?
Couchbase Server is a high-performance NoSQL distributed database with a flexible data model. It scales on commodity hardware to support large data sets with a high number of concurrent reads and writes while maintaining low latency and strong consistency.

# Description
This box installs a Couchbase Server and starts its services. If a MAIN_NODE binding exists it will add the new instance to its cluster.

***

# Deployment Variables
*   **USERNAME**: Name of the admin user
*   **PASSWORD**: Password of the admin user
*   **VERSION**: Version to be installed [2.5.1 as default value]
*   **BUCKET**: Bucket port to be opened [11210 as default value]
*   **CLIENT**: Client port to be opened [11211 as default value]
*   **COUCHBASE**: Couchbase port to be opened [8092 as default value]
*   **EDITION**: Choose between enterprise or community [enterprise as default value] 
*   **ERLANG**: Erlang port to be opened [4369 as default value]
*   **HTTP**: Http port to be opened [8091 as default value]
*   **INTERNAL_BUCKET**: Internal Bucket port to be opened [11209 as default value]
*   **MAIN_NODE**: Binding to the main node. Choose the main node instance at deployment time to create a cluster. 
*   **cookbook**: box that stablishes the couchbase recipe depencency. 
*   **solo**: box that installs the Chef Solo client and runs the couchbase recipe.

***

# Deployment behavior
An instance executing this box will use bash scripting and Chef Solo to download, install and configure Couchbase. Box events handle the Couchbase lifecycle on the instance as follows:

+ Install operation:
	* pre_install event script: detects the linux distribution family and installs git and openssl 0.98e. If a debian family is detected it also updates repository sources, downloads the correct couchbase deb package for the version and edition and installs it with dpkg.
	* solo.pre_install event script: installs the chef-solo client.
+ Configure operation:
	* pre_configure event script: cleans the couchbase's cookbook folder and uses git to clone repository of Couchbase Server's [recipe](https://github.com/ketakigangal/couchbase) repository.
	* cookbook.pre_configure event script: creates the recipes folder and download and configure the default.rb and metadata.rb files of elasticbox recipe.
	* solo.pre_configure event script: downloads and configures solo.rb and solo.json files and uses them to launch the chef-solo client.
+ Start operation:
	* start event script: checks for a MAIN_NODE binding. If exists it uses the couchbase-cli tool to rebalance the cluster with the new instance.
+ Stop operation:
	* stop event script: checks for a MAIN_NODE binding. If exists it uses the couchbase-cli tool to rebalance the cluster removing the instance that is being stoped.

# Supported Distributions
The box supports deploying to these linux distributions:
* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

# Documentation
You can checkout the Couchbase's documentation at http://docs.couchbase.com/

***

# Use cases
You can checkout the Couchbase's use cases at http://www.couchbase.com/use-cases

***

# Licensing and Support FAQ
You can checkout the licensing and support frequently asked questions at http://www.couchbase.com/licensing-and-support-faq

