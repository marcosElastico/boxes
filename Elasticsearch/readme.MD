# What is Elasticsearch?
Elasticsearch is an open-source search engine built on top of Apache Lucene™, a full-text search-engine library. Lucene is arguably the most advanced, high-performance, and fully featured search engine library in existence today—both open source and proprietary.

It can also be described as follows:

* A distributed real-time document store where every field is indexed and searchable
* A distributed search engine with real-time analytics
* Capable of scaling to hundreds of servers and petabytes of structured and unstructured data

And it packages up all this functionality into a standalone server that your application can talk to via a simple RESTful API, using a web client from your favorite programming language, or even from the command line.

# Description
This box installs Elasticsearch and start its services. The CLUSTER_NAME is needed for elasticsearch to add the new instance to the cluster. Any new instance with that cluster name will be automatically added to it. If a REPOSITORY_PATH is defined it will constrain where could be created a new snapshot repository to only inside of that path.

***

## Variables Usage
|  Variable                  | Description                                                      | Default value         |
|----------------------------|------------------------------------------------------------------|-----------------------|
| **CLUSTER_NAME** | Name for the cluster. It needs to be unique||
| **DATA_PATH** | Desired folder for data to be stored | /var/lib/elasticsearch/data |
| **LOGS_PATH** | Desired folder for logs to be stored | /var/log/elasticsearch |
| **REPOSITORY_PATH** | Desired folder for the snapshots. Creation is prevented outside of it | empty |
| **VERSION** | Version to be installed | 1.7.0 |
| **rest** | Rest port to be opened | 9200 |
| **node** | Node communication port to be opened | 9300 |
| **CAN_BE_MASTER** | Choose if this instance can be master of elasticsearch cluster | true |
| **DATA_NODE** | Choose if this instance stores data of elasticsearch cluster | true |
| **HEAP_SIZE** | Heap size number to start with | 1 |
| **REPLICAS** | Number of replicas in the cluster | 1 |
| **SHARDS** | Number of shards or splits of every index | 5 |
| **CONFIG** | Elasticsearch.yml.jinja template that will be configured with the values of the box's variables|||

***

# Behavior
An instance executing this box will use bash scripting to download, install and configure Elasticsearch. Lets see the process being done by each event script of the box with every operation of the life-cycle:

+ Install operation:
	* pre_install event script: update apt-get package lists, installs python-software-properties and software-properties-common. Adds webupd8team's java repository and installs oracle-java8-installer package. Downloads the elasticsearch correct version and installs it with dpkg package manager.And uses update-rc.d to ensure that elasticsearch starts when the system is booted.
	* solo.pre_install event script: installs the chef-solo client.
+ Configure operation:
	* pre_configure event script: creates and set the ownership to elasticsearch user the folders: DATA_PATH and LOGS_PATH and download and configure the elasticsearch.yml file with the variables's values and save it into its default location: /etc/elasticsearch/elasticsearch.yml.
+ Start operation:
	* pre_start event script: set the "max locked memory" to unlimited and restart the elasticsearch service.
+ Stop operation:
	* stop event script: stop the elasticsearch service of the instance overriding its exit code to be 0.

## Compatibility
This box has been tested and working properly with these linux distributions:
* Ubuntu 14.04

***

## Documentation
You can checkout the Elasticsearch's documentation at https://www.elastic.co/guide/index.html

***

## Use cases
You can checkout the Elasticsearch's use cases at https://www.elastic.co/use-cases

***

## Discuss
You can discuss at https://discuss.elastic.co/c/elasticsearch
