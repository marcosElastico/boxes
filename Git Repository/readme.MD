# What is Git?
Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency. Key features:

+ Branching and Merging - Git allows and encourages to have multiple local branches. And improves the merging experience and make easy the deletion of branches. 
+ Small and Fast - Git is fast. Nearly all operations are performed locally, giving it a huge speed advantage on centralized systems that need to communicate with a server.
+ Distributed - Git is distributed, so instead of doing a "checkout" of the current tip of the source code, it does a "clone" of the entire repository.
+ Data Assurance - Git uses a data model that ensures the cryptographic integrity of every bit of a project. Every file and commit is checksummed and retrieved by its checksum when checked back out. 
+ Staging Area - Git has something called the "staging area" or "index". It's an intermediate area where commits can be formatted and reviewed before completing the commit.
+ Free and Open Source - Git is released under the GPLv2 open source license. Everybody is free to inspect the source code at any time or contribute to the project.

# Description
This box installs git and clone the specified repository into a target folder.

***

# Deployment Variables
*   **CLONE_URL**: Url of the remote repository to be cloned
*   **CLONE_DIRECTORY**: Path where the git repository will be cloned
*   **BRANCH**: Branch of the repository to be checkout with git [master as default value]

***

# Deployment behavior
An instance executing this box will use bash scripting to download, install and configure git, and clone a repository. Box events handle the Git Repository lifecycle on the instance as follows:

+ **Install** operation:
    * *pre_install event script:* installs the git package with the correct package manager for the linux distribution (rpm or apt-get).
+ **Configure** operation:
	* *pre_configure event script:* checks for an existing CLONE_DIRECTORY folder. If not it clones the repository of the CLONE_URL into the CLONE_DIRECTORY folder. If it exists, reset the remore url, branch and pulls latest code.

# Supported Distributions
The box supports deploying to these linux distributions:
* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

# Documentation
Checkout the git documentation at https://git-scm.com/documentation

***

# License
```
Git is released under the GNU General Public License version 2.0, which is an open source license. 
The Git project chose to use GPLv2 to guarantee your freedom to share and change free software 
to make sure the software is free for all its users.
```
