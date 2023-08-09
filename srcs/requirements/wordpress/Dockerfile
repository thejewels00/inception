FROM debian:buster

#php fpm fast-cgi process mananger  #mysql and  #curl #mariadb-client and mariadb
RUN apt-get update && apt-get install -y curl php7.3 \
	php7.3-fpm php7.3-mysql mariadb-client 


# word press command line interface 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar ;\
	chmod +x wp-cli.phar ;\
	mv wp-cli.phar /usr/local/bin/wp ;\ 
	mkdir -p /var/www/html/
	
copy scripts/ /

RUN chmod +x /script.sh

CMD ["sh", "script.sh"]