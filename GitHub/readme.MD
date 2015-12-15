# What is GitHub?
GitHub is a web-based Git repository hosting service. Besides the distributed revision control and source code management functionality offered by Git, it includes additional features such as bug tracking, feature requests and task management. Also, GitHub provides web, desktop and mobile graphical interfaces in contrast to Git's command line interface.

# Description
This box installs Git and checks out the desired GitHub repository.

***

# Deployment Variables
*   **git_repo**: Box that installs and configures Git.
*   **git_repo.CLONE_URL**: URL of the remote repository to be cloned.
*   **git_repo.CLONE_DIRECTORY**: Path where the git repository will be cloned.
*   **git_repo.BRANCH**: Branch of the repository to be checked out with git. [master as default value]

***

# Deployment behavior
An instance executing this box will use Bash scripting to download, install and configure git, and clone a GitHub repository. Box events handle the GitHub instance lifecycle as follows:

+ **Install** operation:
    * *pre_install*: Disables the strict host verification for github.com.
    * *git_repo.pre_install*: Installs the git package with the correct package manager for the Linux distribution (rpm or apt-get).
+ **Configure** operation:
    * *git_repo.pre_configure*: Checks for an existing CLONE_DIRECTORY folder. If not it clones the repository of the CLONE_URL into the CLONE_DIRECTORY folder. If it exists, reset the remore url, branch and pulls latest code.


# Supported Linux distributions
This box has been tested on these linux distributions:

* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

# Documentation
For more information, see GitHub's documentation at https://help.github.com/

