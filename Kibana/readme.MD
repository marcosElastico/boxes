# What is Kibana?
Kibana is an open source analytics and visualization platform designed to work with Elasticsearch. You use Kibana to search, view, and interact with data stored in Elasticsearch indices. You can easily perform advanced data analysis and visualize your data in a variety of charts, tables, and maps.

Kibana makes it easy to understand large volumes of data. Its simple, browser-based interface enables you to quickly create and share dynamic dashboards that display changes to Elasticsearch queries in real time.

Setting up Kibana is a snap. You can install Kibana and start exploring your Elasticsearch indices in minutes — no code, no additional infrastructure required.

# Description
This box installs Kibana and start its services. The elasticsearch binding is needed for Kibana's elasticsearch_client to connect to the cluster.

***

## Variables Usage
|  Variable                  | Description                                                      | Default value         |
|----------------------------|------------------------------------------------------------------|-----------------------|
| **domain** | Domain name for nginx server name configuration | example.com |
| **elasticsearch** | Binding to elasticsearch's instance | |
| **elasticsearch_client** | Box that install an elasticsearch client that will be the gateway to the ES cluster | |
| **KIBANA_CONF** | Kibana configuration jinja template that will be configured with the values of the box's variables | |
| **KIBANA_INIT** | Kibana init.d jinja template that will be configured with the values of the box's variables | |
| **kibana_port** | Kibana port to be opened | 5601 |
| **VERSION** | Version to be installed | 4.1.1 |
| **www** | Http port to be opened | 80 |

***

# Behavior
An instance executing this box will use bash scripting to download, install and configure Kibana and an elasticsearch client that will be used as a gateway for doing the queries to the cluster. It also installs an nginx to forward the http request to the Kibana port. Lets see the process being done by each event script of the box with every operation of the life-cycle:

+ Install operation:
	* pre_install event script: updates apt-get package lists, installs python-software-properties and software-properties-common. Adds nginx/stable repository and installs nginx package. Downloads Kibana's correct version and untars it and moves it into kibana folder.
	* elasticsearch_client.pre_install event script: installs elasticsearch client.
+ Configure operation:
	* pre_configure event script: downloads and configures kibana.conf (nginx's configuration file for forwarding requests to kibana) and kibana init.d file with the variables's values and saves them into their default locations: /etc/nginx/conf.d/kibana.conf and /etc/init.d/kibana. Reloads nginx service and sets the cluster name of the elasticsearch_client with the same value that elasticsearch binding, so the client can connect to that cluster.
	* elasticsearch_client.pre_configure event script: configures elasticsearch client.
+ Start operation:
	* pre_start event script: restarts the kibana service.
	* elasticsearch_client.pre_start event script: starts elasticsearch client.
+ Stop operation:
	* stop event script: stops the kibana service of the instance overriding its exit code to be 0.
	* elasticsearch_client.stop event script: stops elasticsearch client overriding its exit code to be 0.

## Compatibility
This box has been tested and working properly with these linux distributions:
* Ubuntu 14.04

***

## Documentation
You can checkout the Kibana's documentation at https://www.elastic.co/guide/en/kibana/current/index.html

***

## Use cases
You can checkout the Kibana's use cases at https://www.elastic.co/use-cases

***

## Discuss
You can discuss at https://discuss.elastic.co/c/kibana
