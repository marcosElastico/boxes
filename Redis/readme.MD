# What is Redis?
Redis is an open source, BSD licensed, advanced *key-value cache* and *store*. It is often referred to as a *data structure server* since keys can contain strings, hashes, lists, sets, sorted sets, bitmaps and hyperloglogs.
You can run *atomic operations* on these types, like appending to a string; incrementing the value in a hash; pushing an element to a list; computing set intersection, union and difference; or getting the member with highest ranking in a sorted set.
In order to achieve its outstanding performance, Redis works with an *in-memory dataset*. Depending on your use case, you can persist it either by dumping the dataset to disk every once in a while, or by appending each command to a log. Persistence can be optionally disabled, if you just need a feature-rich, networked, in-memory cache.

Redis also supports trivial-to-setup master-slave asynchronous replication, with very fast non-blocking first synchronization, auto-reconnection with partial resynchronization on net split.

Other features include:
* Transactions
* Pub/Sub
* Lua scripting
* Keys with a limited time-to-live
* LRU eviction of keys
* Automatic failover

You can use Redis with most programming languages.

# Description
This box installs and starts Redis services.

***

## Customizing Redis with these variables
*   **redisport**: Port to open on the Redis server [6379 is the default].
*   **chef_cookbook**: Chef Cookbook box that downloads the Redis Chef recipe.
*   **chef_solo**: Chef Solo box that downloads, installs, and runs Chef Solo to apply the Redis recipe.

***   Downloads the right Redis version, untars and moves it into the Kibana folder.

## Deploying this box
An instance executing this box uses Puppet and Bash scripts to download, install, and configure Redis. It also installs Nginx to forward HTTP requests to the Redis port. Each event script affects the lifecycle of the Redis server as follows:

+ Install event:
	* chef_solo pre_install: Installs Git, Ruby, ruby-devel and rubygems. Then it initializes the Chef Solo install, which installs all the recipes in the chef_solo.COOKBOOK_LIST file variable.
+ Configure event:
	* chef_cookbook pre_configure: Downloads and configures default.rb and metadata.rb and saves them into the elasticbox recipe folder (cookbooks/$CHEF_COOKBOOK_NAME/).
	* chef_solo pre_configure: Downloads and configures solo.rb given the value of the Chef_SOLO_RB variable and applies the Redis Chef recipe using  solo.rb and solo.json. Chef Solo uses the Redis recipe to download, install and ensure that its services are running.

## Supported Distributions
This deployment works with these Linux distributions:
* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

## Documentation
Check out the Redis documentation at http://redis.io/documentation.

***

## License
```sh
Redis is *open source software* released under the terms of the *three clause BSD license*. 
Most of the Redis source code was written and is copyrighted by Salvatore Sanfilippo and Pieter Noordhuis. 
A list of other contributors can be found in the Git history.

The Redis trademark and logo are owned by Salvatore Sanfilippo and can be used in accordance with the Redis Trademark Guidelines.
```
