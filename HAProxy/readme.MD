# What is HAProxy?
HAProxy is a free, open source, high availability load balancer and proxy for TCP and HTTP.

# Description
This box installs and configures an HAProxy load balancer.

***

## Deployment variables
|  Variable                  | Description                                                      | Default value         |
|----------------------------|------------------------------------------------------------------|-----------------------|
|   **http** | Specifies the port in which HAProxy will listen to connections. | 80 |
|   **fallback_binding_port** | By default, the requests are redirected to the port defined with the "http" variable in the target box. May that variable not be defined, this value is used as a fallback value. | 80 |
|   **CONFIG_FILE** | HAProxy configuration file. ||
|   **CONFIG_FILE_NAME** | HAProxy configuration file name. ||
|   **MODE** | The mode in which HAProxy will handle the requests. | http |
|   **servers** | Binding to the servers that we want to load balance.|||

***

## Deployment behavior
An instance executing this box uses bash scripts and chef-solo to download, install, and configure Nginx. Box events manage the Nginx lifecycle as follows:

+ **Install** operation:
    * *install*: Installs HAProxy depending on the platform.
+ **Configure** operation:
    * *configure*: Downloads the configuration file, applying to it the desired configuration.
+ **Start** operation:
    * *start*: Starts HAProxy.

## Supported distributions
This deployment supports these Linux distributions:
* Amazon Linux AMI 2015.03
* Ubuntu 14.04

***

## Documentation
For more information, see the HAProxy [documentation](https://cbonte.github.io/haproxy-dconv/configuration-1.5.html).
