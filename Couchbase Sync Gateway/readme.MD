# What is Couchbase Sync Gateway?
Couchbase Sync Gateway is an internet-facing cloud component that securely synchronizes data between Couchbase Lite on the mobile devices and the Couchbase servers on the cloud.

# Description
This box installs a Couchbase Sync Gateway and start its synchonization services with the COUCHBASE_SERVER binding.

***

# Deployment Variables
*   **ADMIN_PORT**: Admin port to be opened [4985 as default value]
*   **BUCKET**: Bucket name of the database to be synchronized.
*   **CONFIG**: Config.json file to be configured with the variables values.
*   **COUCHBASE_SERVER**: Binding to the Couchbase Server to synchronize with.
*   **EDITION**: Choose between enterprise or community [enterprise as default value] 
*   **SYNC_PORT**: Sync port to be opened [4984 as default value]

***

# Deployment behavior
An instance executing this box will use bash scripting to download, install and configure Couchbase Sync Gateway. Box events handle the Couchbase Sync Gateway lifecycle on the instance as follows:

+ Install operation:
	* pre_install event script: detects the linux distribution family, downloads the correct Couchbase Sync Gateway package (rpm or deb) for the select edition and installs it using rpm or dpkg package manager.
+ Start operation:
	* pre_start event script: downloads and configures config.json file and uses it to launch the sync gateway in background.

# Supported Distributions
The box supports deploying to these linux distributions:
* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

# Documentation
Checkout the Couchbase's documentation at http://docs.couchbase.com/

***

# Use cases
Checkout the Couchbase's use cases at http://www.couchbase.com/use-cases

***

# Licensing and Support FAQ
Checkout the licensing and support frequently asked questions at http://www.couchbase.com/licensing-and-support-faq
