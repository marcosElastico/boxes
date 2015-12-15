# What is Rails?
Rails is a web application development framework written in the Ruby language. It is designed to make programming web applications easier by making assumptions about what every developer needs to get started. It allows you to write less code while accomplishing more than many other languages and frameworks.

The Rails philosophy includes two major guiding principles:
*   **Don't Repeat Yourself**
*   **Convention Over Configuration**

# Description
This box installs Ruby on Rails and checks out a [bootstrap Rails project](https://github.com/ElasticBox/rails-quickstart) to help you get started.

***

# Deployment Variables
*   **CLONE_URL**: The repository that is going to be deployed in Ruby on Rails. [https://github.com/ElasticBox/rails-quickstart as default value]
*   **RAILS_APP**: The name of the application that is going to be deployed. [rails-quickstart as default value]
*   **http**: HTTP port to be opened. [3000 as default value]
*   **cookbook**: Box that stablishes the Rails recipe dependency. 
*   **solo**: Box that installs the Chef Solo client and runs the Rails recipe.

***

# Deployment behavior
An instance executing this box will use bash scripting and Chef Solo to download, install and configure Rails. Box events handle the Rails quickstart lifecycle on the instance as follows:

+ **Install** operation:
    * *solo.pre_install*: Installs the Chef Solo client.
    * *install*: Installs the SQLite client.
+ **Configure** operation:
    * *cookbook.pre_configure*: Creates the recipes folder and downloads and configures the default.rb and metadata.rb files of ElasticBox's recipe.
    * *solo.pre_configure*: Downloads and configures solo.rb and solo.json files and uses them to launch the chef-solo client which will download and install Rails.
+ **Start** operation:
    * *start*: Executes the Rails server.

# Supported Distributions
The box supports deploying to these linux distributions:

* Amazon Linux AMI 2015.03
* Centos 6.5
* Ubuntu 12.04

***

# Documentation
For more information, see Ruby on Rails documentation at http://rubyonrails.org/documentation/.

***

# License
Rails is released under the MIT license.
