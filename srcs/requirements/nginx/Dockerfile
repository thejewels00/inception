FROM debian:buster

RUN apt-get update && apt-get install nginx -y && apt-get install openssl -y

COPY conf/ /etc/nginx/conf.d/

COPY index.php /index.php

RUN mkdir /etc/nginx/ssl 


RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/jchennak_cert.crt \
    -keyout /etc/nginx/ssl/jchennak_private.key \
    -subj "/C=MA/ST=Bng/L=Bng/O=42 School/OU=jchennak/CN=jchennak/"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
