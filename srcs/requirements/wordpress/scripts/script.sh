#!/bin/bash

chown -R www-data:www-data /var/www/html/*

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf

cd /var/www/html/

curl -O https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz 
rm -rf latest.tar.gz
chown -R www-data:www-data /var/www/html/wordpress/*
cd /var/www/html/wordpress


#dowlanding wordpress files 
#wp core download --allow-root --path=/var/www/html/

#bach yb9a mhangi mhangi mrani :D
exec php-fpm7.3 -F -R
