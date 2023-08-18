#!/bin/bash

#mariadb script 

sed -i 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf


service mysql start


mysql -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWD}';"

mysql -u root  mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB};" 

mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWD}';"

mysql -u root -e "FLUSH PRIVILEGES;"

service mysql stop


mysqld




