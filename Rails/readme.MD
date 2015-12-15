# What is Rails?
Rails is a web application development framework written in the Ruby language. It is designed to make programming web applications easier by making assumptions about what every developer needs to get started. It allows you to write less code while accomplishing more than many other languages and frameworks.

The Rails philosophy includes two major guiding principles:
*	**Don't Repeat Yourself**
*	**Convention Over Configuration**

# Description
This box installs Rails and start its services.

***

# Deployment Variables
*   **http**: Http port to be opened [3000 as default value]
*   **cookbook**: box that stablishes the Rails recipe dependency. 
*   **solo**: box that installs the Chef Solo client and runs the Rails recipe.

***

# Deployment behavior
An instance executing this box will use bash scripting and Chef Solo to download, install and configure Rails. Box events handle the Rails lifecycle on the instance as follows:

+ Install operation:
	* *solo.pre_install event script:* installs the chef-solo client.
	* *install event script:* installs the sqlite client.
+ Configure operation:
	* *cookbook.pre_configure event script:* creates the recipes folder and download and configure the default.rb and metadata.rb files of elasticbox recipe.
	* *solo.pre_configure event script:* downloads and configures solo.rb and solo.json files and uses them to launch the chef-solo client which will download and install the Rails.
+ Start operation:
	* *start event script:* executes the Rails server on production.

# Supported Distributions
The box supports deploying to these linux distributions:
* Amazon Linux AMI 2015.03
* Centos 6.5
* Ubuntu 12.04

***

## Documentation
Checkout Rails's documentation [here](http://rubyonrails.org/documentation/).

***

## License
Rails is released under the MIT license.