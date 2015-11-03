# What is Logstash?
Logstash is a tool for receiving, processing and outputting logs. All kinds of logs. System logs, webserver logs, error logs, application logs, and just about anything you can throw at it.

Logstash provides a powerful pipeline for storing, querying, and analyzing your logs. When using Elasticsearch as a backend data store and Kibana as a front-end reporting tool, Logstash acts as the workhorse. It includes an arsenal of built-in inputs, filters, codecs, and outputs, enabling you to harness some powerful functionality with a small amount of effort.

# Description
This box installs Logstash and start its services. The elasticsearch binding is needed for logstash to send the log data to correct cluster (elasticsearch.CLUSTER_NAME).
It's also necesary upload a key and certificate files as they are required for ssl support.

***

## Variables Usage
|  Variable                  | Description                                                      | Default value         |
|----------------------------|------------------------------------------------------------------|-----------------------|
|   **HOSTNAME** | Hostname variable to be set by the scripts | |
|   **VERSION** | Version to be installed | 1.5.2 |
|   **elastisearch** | elasticsearch's binding to communicate with for sending the logs | |
|   **LOGSTASH_CONF** | logstash.conf.jinja configuration template that will be configured with the values of the box's variables | |
|   **LOGSTASH_FILTERS** | Logstash's filters configuration file | |
|   **LOGSTASH_PATTERNS** | Logstash's patterns configuration file | |
|   **lumberjack_port** | Lumberjack port to be opened | 5009 |
|   **tcp_port** | Tcp port to be opened | 5959 |
|   **transport_port** | Communication port to be opened | 9300 |
|   **LOGSTASH_CRT** | Certificate file for SSL support | |
|   **LOGSTASH_KEY** | Key file for SSL support | |
|   **LOGSTASH_CRT_PATH** | Desired path for the certificate file to be stored | /etc/logstash/logstash.crt |
|   **LOGSTASH_KEY_PATH** | Desired path for the key file to be stored | /etc/logstash/logstash.key |



***

# Behavior
An instance executing this box will use bash scripting to download, install and configure Logstash. Lets see the process being done by each event script of the box with every operation of the life-cycle:

+ Install operation:
	* pre_install event script: updates apt-get package's lists, installs python-software-properties and software-properties-common. Adds webupd8team's java repository and installs oracle-java8-installer package. Downloads the logstash correct version package and installs it with dpkg package manager. Stops and removes the logstash-web service. Sets the HOSTNAME variable of the box.
+ Configure operation:
	* pre_configure event script: donwloads the certificate and the key files and stores them into the paths specified in the box's variables. Downloads and configures the configuration, filter and patterns files, saves them. Sets the ownership to logstash:logstash user the patterns folder.
+ Start operation:
	* pre_start event script: starts logstash's service.
+ Stop operation:
	* stop event script: stops logstash's service overriding its exit code to be 0.

## Compatibility
This box has been tested and working properly with these linux distributions:
* Ubuntu 14.04

***

## Documentation
You can checkout the Logstash's documentation at https://www.elastic.co/guide/en/logstash/current/index.html

***

## Discuss
You can discuss at https://discuss.elastic.co/c/logstash
