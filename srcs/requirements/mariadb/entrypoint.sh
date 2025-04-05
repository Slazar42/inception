#!/bin/bash

#_______________ Start MariaDB Service ______________#
# Start the MariaDB service
service mariadb start
# Wait for 4 seconds to ensure MariaDB has started
sleep 4

#_______________ MariaDB Configuration ______________#
# Create the database if it doesn't already exist
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;"

# Create the user if it doesn't exist, and set a password
mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Grant all privileges on the created database to the user
mariadb -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO \`${MYSQL_USER}\`@'%';"

# Apply the changes and flush privileges
mariadb -e "FLUSH PRIVILEGES;"

#_______________ Restart MariaDB with New Config ______________#
# Shutdown MariaDB to apply the new configurations
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

# Restart MariaDB in the background with the updated configurations
# This ensures the container continues running while MariaDB operates
mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
