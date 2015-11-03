# What is Jenkins?
Jenkins is an application that monitors executions of repeated jobs, such as building a software project or jobs run by cron. Among those things, current Jenkins focuses on the following two jobs:

* **Building/testing software projects continuously, just like CruiseControl or DamageControl.** In a nutshell, Jenkins provides an easy-to-use so-called continuous integration system, making it easier for developers to integrate changes to the project, and making it easier for users to obtain a fresh build. The automated, continuous build increases the productivity.

* **Monitoring executions of externally-run jobs, such as cron jobs and procmail jobs, even those that are run on a remote machine.** For example, with cron, all you receive is regular e-mails that capture the output, and it is up to you to look at them diligently and notice when it broke. Jenkins keeps those outputs and makes it easy for you to notice when something is wrong.

Jenkins offers the following features:

* **Easy installation:** Just java -jar jenkins.war, or deploy it in a servlet container. No additional install, no database.
* **Easy configuration:** Jenkins can be configured entirely from its web GUI with extensive on-the-fly error checks and inline help.
* **Change set support:** Jenkins can generate a list of changes made into the build from Subversion/CVS. 
* **Permanent links:** Jenkins gives you clean readable URLs for most of its pages, including some permalinks like "latest build"/"latest successful build", that can be easily linked from elsewhere.
* **RSS/E-mail/IM Integration:** Monitor build results by RSS or e-mail to get real-time notifications on failures.
* **After-the-fact tagging:** Builds can be tagged long after builds are completed.
* **JUnit/TestNG test reporting:** JUnit test reports can be tabulated, summarized, and displayed with history information, such as when it started breaking, etc. History trend is plotted into a graph.
* **Distributed builds:** Jenkins can distribute build/test loads to multiple computers.
* **File fingerprinting:** Jenkins can keep track of which build produced which jars, and which build is using which version of jars, and so on.
* **Plugin Support:** Jenkins can be extended via 3rd party plugins.


## Description
This box installs Jenkins and some of its most used plugins for Source Code Management and Continous Integration - ElasticBox CI, git, scm, ghprb, etc. Then it starts Jenkins services.

## NOTE: 
```
Default password for the Jenkin's admin user is 'elasticbox'
```

***

## Variables Usage
|  Variable                  | Description                                                      | Default value         |
|----------------------------|------------------------------------------------------------------|-----------------------|
| **ADMIN** | Configuration file for the jenkins administration (config.xml) | |
| **ELASTICBOX_TOKEN** | Token to allow Jenkins to manage an ElasticBox cloud using the plugin | |
| **ELASTICBOX_URL** | SAS or Appliance URL to be managed by Jenkins using the plugin | |
| **http** | Http port to be opened | 80 |
| **https** | Https port to be opened | 443 |
| **JENKINS_CONFIG** | Global configuration file of Jenkins (jenkins_config.xml) | |
| **JENKINS_PRIVATE_KEY** | Jenkins private key - if not provided it will be generated - | |
| **JENKINS_PUBLIC_KEY** | Jenkins public key - if not provided it will be generated - | |
| **SERVER_NAME** | Server name for the Nginx configuration | |
| **NGINX_CONF** | Jinja template for Nginx's configuration file (nginx.conf.jinja) | |
| **VIRTUAL_CONF** | Jinja template for Nginx's virtual servers configuration file (virtual.conf.jinja) | |
| **SSH_CONFIG** | Open ssh configuration file (ssh.config) | | |

***

## Behavior
An instance executing this box will use bash scripting to download, install and configure Jenkins. Lets see the process being done by each event script of the box with every operation of the life-cycle:

+ Install operation:
	* pre_install event script: update apt-get package lists, after install apt-key for jenkins repository sources list. Installs jenkins, nginx and git packages with apt-get. Downloads the certificate and the private key for ssl support.
+ Configure operation:
	* pre_configure event script: downloads and configures nginx's configuration files with the box variables's values and save them into their default locations: /etc/nginx/nginx.conf and /etc/nginx/conf.d/virtual.conf
	* configure event script: downloads and save the private and public key for Jenkins and configure them into the ssh configuration. Installs the latest [ElasticBox CI plugin](https://wiki.jenkins-ci.org/display/JENKINS/Use+Jenkins), the plugins for source code management (git and github), and the ssh agent. Downloads and saves the ElasticBox CI configuration file and restart the jenkins service.

## Compatibility
This box has been tested and working properly with these linux distributions:
* Ubuntu 14.04

***

## Documentation
You can checkout the Jenkins wiki at https://wiki.jenkins-ci.org/display/JENKINS/Use+Jenkins

***

## License
```
The MIT License

Copyright (c) 2004-, Kohsuke Kawaguchi, Sun Microsystems, Inc., and a number of other of contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
