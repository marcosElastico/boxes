# What is a Cookbook?
A cookbook is the chef-client's unit of configuration and policy distribution which defines a scenario and contains everything that is required to support it:
* Recipes that specify which resources to use and its order to be applied
* Attribute and its values
* File distributions and Templates
* Extensions to Chef, such as libraries, definitions, and custom resources

The chef-client uses Ruby as its reference language for its cookbooks and recipes.

# What is Chef-solo?
Chef-solo is an open source version of the chef-client that allows using cookbooks with nodes without requiring access to a Chef server. chef-solo runs locally and requires that a cookbook (and any of its dependencies) be on the same physical disk as the node.

# Description
This box allows you to include legacy chef's cookbooks or recipes into your Application Catalog within ElasticBox. It downloads a Chef Cookbook's configuration files for be used by chef-solo. It's intended to customize a cookbook with its own default.rb and metadata.rb files that will define recipe's attributes and its needed dependencies.

***

# Deployment Variables
*   **CHEF_COOKBOOK_NAME**: Name of the cookbook and its directory
*   **CHEF_DEFAULT_RB**: is the attributes file to be configured and saved into the cookbook folder (CHEF_COOKBOOK_NAME). For each cookbook, attributes in the default.rb file are loaded first. When the cookbook attributes take precedence over the default attributes, the chef-solo client will apply those new settings and values when chef-solo client run on the instance.
*   **CHEF_METADATA_RB**: Every cookbook requires a small amount of metadata stored in a file called *metadata.rb* that lives at the top of CHEF_COOKBOOK_NAME’s directory. The contents of the metadata.rb file provides hints to chef-solo so that cookbook is deployed correctly.

***

# Deployment behavior
An instance executing this box will use bash scripting to download and save the configuration of a Cookbook. Box events handle the chef-cookbook lifecycle on the instance as follows:

+ Configure operation:
	* pre_configure event script: creates cookbook's folder and download and configure the default.rb and metadata.rb files defined in the box variables.

# Supported Distributions
The box supports deploying to these linux distributions:
* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

## Documentation
You can checkout the Chef Cookbook's documentation at http://docs.chef.io/cookbooks.html
