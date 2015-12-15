# What is Ruby?
Ruby is a dynamic programming language developed by Yukihiro Matsumoto in the mid-1990s. It supports multiple programming paradigms, including functional, object-oriented, and imperative.

# Description
This box installs the desired version of the Ruby programming language.

***

# Deployment Variables
*   **RVM_RUBY_VERSION**: The version of Ruby that will be installed using the Ruby Version Manager. [2.1.2 as default value]

***

# Deployment behavior
An instance executing this box will use Bash scripting to download, install and configure Ruby. Box events handle the Ruby instance lifecycle as follows:

+ **Install** operation:
    * *pre_install*: Installs the chosen Ruby version using the Ruby Version Manager (RVM).


# Supported Distributions
The box supports deploying to these linux distributions:

* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

# Documentation
For more information, see Ruby's documentation at http://ruby-doc.org/
