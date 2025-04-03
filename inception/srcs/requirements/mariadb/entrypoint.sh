#!/bin/bash
service mysql start
mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER 'user'@'%' IDENTIFIED BY 'password';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'%';"
mysql -e "FLUSH PRIVILEGES;"
tail -f /dev/null
