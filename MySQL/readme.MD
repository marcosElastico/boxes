# What is MySQL?
MySQL is an open-source relational database management system (RDBMS), property of Oracle Corporation. The project is open sourced under the GNU General Public License as well as under a variety of proprietary agreements, which offer extended functionality.

# Description
This box allows to manage a single MySQL instance, as well as a Master-Slave replication with either one or two masters. Master and slave nodes can be added to the system as long as the database is not populated (i.e. it's a new deployment).

***

# Deployment Variables
|  Variable                  | Description                                                      | Default Value         |
|----------------------------|------------------------------------------------------------------|-----------------------|
| **DATABASE_NAME** | The name of the database to be created. This variable is required to deploy a single node or a master | |
| **PORT** | The port on which the MySQL daemon will run on. |3306|
| **SERVER_ID** | The unique identifier of the server. A random value will be calculated at runtime if no value is provided | |
| **SLAVE_USERNAME** | The name of the user that will perform the replication. |slave_user|
| **SLAVE_PASSWORD** | The password of the replication user. A random password will be calculated if no value is provided | |
| **CONFIGURATION_FILE** | MySQL's daemon configuration file (my.cnf) | |
| **MASTER_SQL_CONFIGURATION** | File containing the SQL commands to be run in a master node | |
| **SLAVE_SQL_CONFIGURATION** | File containing the SQL commands to be run in a slave node | |
| **NODE_TYPE** | Allows to select if a node will act as a Master or a Slave. |Master|
| **BINARY_LOG_FILE** | Binary log file in which to start a replica. This value is calculated at runtime and any user provided value will be overriden | |
| **BINARY_LOG_POSITION** | Binary log position in which to start a replica. This value is calculated at runtime and any user provided value will be overriden | |
| **MASTER_BINDING** | Binding to a master node | | |

***

# Deployment Configuration
There are three different configurations of this box, namely single instance, master-slaves replication and master-master replication. Each of them can be deployed as follows:

1.   **Single instance**: In order to deploy a single MySQL instance, the only necessary step is to chose a database name through the `DATABASE_NAME` variable.
2.   **Master-Slave replication**: Several slaves can be added for replication using a single master. In order to deploy an slave, select "Slave" in the `NODE_TYPE` variable and add the necessary tags to match the master binding you want to connect to in `MASTER_BINDING`.
3.   **Master-Master replication**: There are three necessary steps to make this deployment:

    - Deploy a single instance following the steps in point 1.
    - Deploy a second master pointing to the one previously deployed.
    - Add a binding to the first instance in order to point to the second and reconfigure it.

    Also, if you want to add slaves to this master-master configuration, follow the steps described in point 2.


# Supported distributions
This deployment supports these Linux distributions:

* Ubuntu 14.04
* Red Hat Enterprise Linux on Amazon EC2

***

# Documentation
Checkout MySQL's [documentation](https://dev.mysql.com/doc/).


***

# Discuss
Discuss at Mysql [forums](http://forums.mysql.com/).
