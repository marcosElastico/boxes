# What is chef-solo?
chef-solo, the open source version of chef-client, processes cookbooks on instances (or nodes) without requiring access to a Chef server. Although chef-solo runs independently, it needs a cookbook and any of its dependencies to be on the same disk as the instance.

# What is a cookbook?
A cookbook is a piece of configuration and policy distribution, which covers an infrastructure automation scenario and includes everything it needs to support it:

* Recipes specify which resources to use and the order in which to use them
* Attributes and values
* File distributions and templates
* Extensions to Chef, such as libraries, definitions, and custom resources

Chef cookbooks and recipes are Ruby based.

# Description
This box downloads, installs, and runs chef-solo using the configuration in the solo.rb and solo.json variables.

***

# Customizing the chef-solo deployment using variables
*   **CHEF_SOLO_JSON**: Contains all attribute values that chef-solo applies when processing the recipes on the specific instance. In this JSON file, specify the run-list of recipes for chef-solo to follow. 
*   **CHEF_SOLO_RB**: solo.rb details the chef-solo configuration. When present, its settings override the default configuration. When it runs on the instance, chef-solo takes on these new settings.
*   **COOKBOOK_LIST**: List all the cookbooks required by the Chef run-list in this file. Git downloads these cookbooks onto the instance cookbooks local repository so that chef-solo has all the dependencies to deploy the recipes/cookbooks from the run-list.

***

# Deployment behavior
An instance executing this box uses bash scripting to download, install, and configure chef-solo. Box events handle the chef-solo lifecycle on the instance as follows:

+ Install operation:
	* pre_install: Installs chef-solo on the instance using a chef node bootstrap script. It also downloads all the cookbooks from the COOKBOOK_LIST file into the cookbooks local repository of the instance using Chef's knife command line tool.
+ Configure operation:
	* pre_configure: Downloads solo.rb and solo.json and configures  solo.rb per the configuration in those files. It saves solo.rb onto the instance disk and runs chef-solo to install all the required recipes/cookbooks from the solo.json file's run-list and applies all the configuration detailed in the solo.rb file.

# Supported Distributions
The box supports deploying to these linux distributions:
* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

# Documentation
For more information, see the chef-solo documentation at https://docs.chef.io/chef_solo.html