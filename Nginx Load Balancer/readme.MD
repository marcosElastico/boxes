# What is Nginx?
Nginx is a high-performance HTTP and reverse proxy server, a mail proxy server, and a generic TCP proxy server written originally by Igor Sysoev.

# Description
This box installs and configures Nginx to behave as an HTTP/HTTPS load balancer.

***

# Deployment Variables
|  Variable                  | Description                                                      | Value                 |
|----------------------------|------------------------------------------------------------------|-----------------------|
|   **http** | The port in which the Nginx will start listening to. |80|
|   **fallback_binding_port** | By default, this box redirects the request to the port named "http" in the target box. This value defines a fallback in case that box doesn't have an "http" variable. |80|
|   **servers** | Binding to the instances that will be load balanced | |
|   **NGINX_CONF** | Nginx general configuration file | |
|   **VIRTUAL_CONF** | Configuration file that contains all the bindings | |
|   **SSL_ENABLED** | Flag to enable SSL encryption. |no|
|   **PUBLIC_SSL_CERTIFICATE** | Public SSL certificate. Only used if `SSL_ENABLED` is set to `yes` | |
|   **PRIVATE_SSL_CERTIFICATE** | Private SSL certificate. Only used if `SSL_ENABLED` is set to `yes` | | |

***

# Usage 
This box can be used to deploy both an HTTP and an HTTPS load balancer:

*   **HTTP**: Select the bindings that are going to be load balanced using the `servers` variable. If those instances do not contain the `http` port variable, define that value by using `fallback_binding_port`.
*   **HTTPS**: Besides the previous steps, you should also upload both the public and private SSL certificates and enable SSL by seting the variable `SSL_ENABLED` to `yes`.


# Supported Distributions
The box supports deploying to these linux distributions:

* Ubuntu 14.04
* Red Hat Enterprise Linux on Amazon EC2

***

# Documentation

For more information, see the Nginx [documentation](http://nginx.org/en/docs/).
