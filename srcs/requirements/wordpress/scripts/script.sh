#!/bin/bash

cd /var/www/html/
#dowlanding wordpress files 
wp core download --allow-root --path=/var/www/html/

#bach yb9a mhangi mhangi mrani :D
exec php-fpm7.3 -F -R
