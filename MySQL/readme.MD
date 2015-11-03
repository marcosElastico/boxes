# What is MySQL?
MySQL is an open-source relational database management system (RDBMS), property of Oracle Corporation. The project is open sourced under the GNU General Public License as well as under a variety of proprietary agreements, which offer extended functionality.

# Description
This box allows to manage a single MySQL instance, as well as a Master-Slave replication. Master and slave nodes can be added to the system as long as the database is not populated (i.e. it's a new deployment).

***

# Deployment Variables
|  Variable                  | Description                                                      | Default Value         |
|----------------------------|------------------------------------------------------------------|-----------------------|
| **DATABASE_NAME** | The name of the database to be created. This variable is required to deploy a single node or a master |default_db|
| **MYSQL_USER** | The name of the user that will perform the replication. |default_user|
| **MYSQL_PASSWORD** | The password of the replication user. A random password will be calculated if no value is provided | |
| **DATA_DIRECTORY** | Folder where mysql stores the database |/var/lib/mysql|
| **mysql** | The port on which the MySQL daemon will run on. |3306|
| **MY_CNF** | MySQL's daemon configuration file (my.cnf) | |
| **master** | Binding to a master node | | |

***

# Deployment Configuration
There are two different configurations of this box, namely single instance, master-slaves replication and master-master replication. Each of them can be deployed as follows:

1.   **Single instance**: In order to deploy a single MySQL instance, the only necessary step is to chose a database name through the `DATABASE_NAME` variable.

2.   **Master-Slave replication**: Several slaves can be added for replication using a single master. In order to deploy an slave, select "Slave" in the `NODE_TYPE` variable and add the necessary tags to match the master binding you want to connect to in `master`.

# Supported distributions
This deployment supports these Linux distributions:

* Amazon Linux AMI 2015.03
* Centos 6.5, 7
* RedHat 7
* Ubuntu 12.04, 14.04

***

# Documentation
Checkout MySQL's [documentation](https://dev.mysql.com/doc/).
