# What is RabbitMQ?
RabbitMQ is a complete and highly reliable enterprise messaging system based on the AMQP standard. It offers a variety of features to let you trade off performance with reliability, including persistence, delivery acknowledgements, publisher confirms, and high availability. 

It is one of the most popular messaging systems in contemporary applications with high scalability requirements, including:

* **Flexible Routing:** Messages are routed through exchanges before arriving at queues. RabbitMQ features several built-in exchange types for typical routing logic. For more complex routing you can bind exchanges together or even write your own exchange type as a plugin.
* **Clustering:** Several RabbitMQ servers on a local network can be clustered together, forming a single logical broker.
* **Federation:** For servers that need to be more loosely and unreliably connected than clustering allows, RabbitMQ offers a federation model.
* **Highly Available Queues:** Queues can be mirrored across several machines in a cluster, ensuring that even in the event of hardware failure your messages are safe.

# Description
This box installs RabbitMQ and start its services.

***

# Deployment Variables
*   **RABBITMQ_CONFIG**: RabbitMQ configuration jinja template that will be configured with the values of the box's variables.
*   **RABBITMQ_ENV_CONF**: RabbitMQ env.conf jinja template that will be configured with the values of the box's variables.
*   **LOG_BASE**: RabbitMQ log base folder [ /var/log/rabbitmq as default value ]
*   **MNESIA_BASE**: RabbitMQ mnesia base folder [ /var/lib/rabbitmq/mnesia as default value ]
*   **FILEDESCRIPTORS**: RabbitMQ filedescriptors limit [ 10240 as default value ]
*   **USERNAME**: Name of the admin user
*   **PASSWORD**: Password of the admin user
*   **VERSION**: Version to be installed [3.2.4 as default value]
*   **mgmt**: Management port to be opened [15672 as default value]
*   **ssl**: Management port to be opened [5671 as default value]
*   **rabbitmq**: Management port to be opened [5672 as default value]
*   **CA_CERT_PATH**: RabbitMQ CA certificate destination path [ read only ]
*   **SERVER_CERT_PATH**: RabbitMQ server certificate destination path [ read only ]
*   **SERVER_KEY_PATH**: RabbitMQ server key destination path [ read only ]
*   **CA_CERT_FILE**: RabbitMQ CA certificate file
*   **SERVER_CERT_FILE**: RabbitMQ server certificate file
*   **SERVER_KEY_FILE**: RabbitMQ server key file


***

# Deployment behavior
An instance executing this box will use puppet and bash scripting to download, install and configure RabbitMQ. It also installs an nginx to forward the http request to the RabbitMQ port. Box events handle the RabbitMQ lifecycle on the instance as follows:

+ **Install** operation:
	* *pre_install event script:* If CA certificate file is provided, creates the ssl folder: /etc/rabbitmq/ssl, downloads all the ca certificate, server certificate and server key files and set the values for their destination paths.
    * *github.pre_install event script:* disables the strict host verification for github.com.
    * *github.gitrepo.pre_install event script:* installs git with rpm or apt-get.
    * *puppet.pre_install event script:* installs the correct release of puppet.
+ **Configure** operation:
	* *github.gitrepo.pre_configure event script:* check for the repository folder. If exists it is updated to latest. If not it clones the repository of the rabbitmq puppet recipe into the target folder.
	* *puppet.pre_configure event script:* download and configure common.yaml, puppet.conf, hiera.yaml with the variables's values and save them into their default location: /etc/puppet/. Then it apply the puppet recipe and overrides the exit code 2 that means no changes for puppet. The rabbitmq puppet's recipe will download RabbitMQ's correct version install it and ensure the service is running.

# Supported Distributions
The box supports deploying to these linux distributions:
* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

# Documentation
Checkout the RabbitMQ's documentation at https://www.rabbitmq.com/documentation.html

***

# License
```
RabbitMQ is distributed under the terms of the *Mozilla Public license*. 

Check this page which contains the complete license text as used in the RabbitMQ distributions:
https://www.rabbitmq.com/mpl.html

```
