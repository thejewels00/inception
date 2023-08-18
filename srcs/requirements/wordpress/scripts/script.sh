#!/bin/bash

#wordpress script


mkdir -p /var/www/html/
mkdir -p /run/php

chown -R www-data:www-data /var/www/html/*
chown -R www-data:www-data /run/*

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf

cd /var/www/html/

curl -O https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
rm -rf latest.tar.gz
chown -R www-data:www-data /var/www/html/wordpress/*
cd /var/www/html/wordpress


#creating users :D 

wp config create --dbname=$MYSQL_DB  --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWD --dbhost=mariadb --allow-root
wp core install --url=jchennak.42.fr --title=inception --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWD --admin_email=$WP_ADMIN_MAIL --allow-root
wp user create $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PASSWD --role=author --allow-root 

#bach yb9a mhangi  mrani :D
exec php-fpm7.3 -F -R
