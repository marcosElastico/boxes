# What is Nginx?
Nginx [voiced as engine x] is a high-performance HTTP and reverse proxy server, a mail proxy server, and a generic TCP proxy server written originally by Igor Sysoev.

# Description
This box installs an Nginx server and starts its services without any customization.

***

## Deployment variables
*   **http**: Specifies the HTTP port to open [80 is default].
*   **cookbook**: Pulls the Nginx chef recipe using the Chef cookbook box. 
*   **solo**: Installs chef-solo to run the Nginx recipe.

***

## Deployment behavior
An instance executing this box uses bash scripts and chef-solo to download, install, and configure Nginx. Box events manage the Nginx lifecycle as follows:

+ Install operation:
	* chef_solo pre_install: Installs chef-solo.
+ Configure operation:
	* chef_cookbook pre_configure: Creates the recipes folder, downloads and configures the default.rb and metadata.rb files of the Chef cookbook from ElasticBox.
	* chef_solo pre_configure: Downloads and configures solo.rb and solo.json files to run chef-solo, which will follow the Nginx recipe to install the Nginx server on the instance.

## Supported distributions
This deployment supports these Linux distributions:
* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

## Documentation
For more information, see the Nginx documentation at http://nginx.org/en/docs/.

***

## License
'''
 
Copyright (C) 2002-2015 Igor Sysoev
Copyright (C) 2011-2015 Nginx, Inc.
All rights reserved.
 *
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.
 
'''
