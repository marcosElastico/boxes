# What is Wordpress?
Wordpress is a powerful semantic publishing platform, and it comes with a great set of features designed to make your experience as a publisher on the Internet as easy, pleasant, and appealing as possible. It's freely distributed, standards-compliant, fast, light, and free content management system, with sensible default settings and features, and an extremely customizable core.

# Description
This box installs a Wordpress Server and start its services.

***

## Deployment Variables
*   **http**: Http port to be opened [80 as default value]
*   **https**: Https port to be opened [443 as default value]
*   **cookbook**: box that stablishes the wordpress recipe depencency. 
*   **solo**: box that installs the Chef Solo client and runs the wordpress recipe.

***

## Behavior
An instance executing this box will use bash scripting and Chef Solo to download, install and configure Wordpress. Each event script affects the lifecycle of the Wordpress instance as follows:

+ Install operation:
	* *solo.pre_install event script:* installs the chef-solo client.
+ Configure operation:
	* *cookbook.pre_configure event script:* creates the recipes folder and download and configure the default.rb and metadata.rb files of elasticbox recipe.
	* *solo.pre_configure event script:* downloads and config solo.rb and solo.json files and uses them to launch the chef-solo client which will download and install the wordpress.

## Supported Distributions
This deployment works with these Linux distributions:

* Amazon Linux AMI 2015.03
* Centos 6.5
* Ubuntu 12.04

***

## Documentation
You can checkout the Wordpress's documentation [here](https://codex.wordpress.org/Main_Page).

***

## Licensing
You can checkout the Wordpress's licensing [here](https://wordpress.org/about/license/).

