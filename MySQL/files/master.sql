CREATE DATABASE IF NOT EXISTS {{ DATABASE_NAME }};

GRANT REPLICATION SLAVE ON *.* TO '{{ SLAVE_USERNAME }}'@'%' IDENTIFIED BY '{{ SLAVE_PASSWORD }}';
FLUSH PRIVILEGES;

{% if MASTER_BINDING | length > 0 %}
STOP SLAVE;

CHANGE MASTER TO
    MASTER_HOST='{{ MASTER_BINDING.address.private }}',
    MASTER_USER='{{ MASTER_BINDING.SLAVE_USERNAME }}',
    MASTER_PASSWORD='{{ MASTER_BINDING.SLAVE_PASSWORD }}',
    MASTER_LOG_FILE='{{ MASTER_BINDING.BINARY_LOG_FILE }}',
    MASTER_LOG_POS={{ MASTER_BINDING.BINARY_LOG_POSITION }};

START SLAVE;
{% endif %}
