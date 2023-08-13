FROM debian:buster

RUN apt-get update && apt-get install mariadb-server -y


COPY scripts/ /

RUN chmod +x /script.sh

EXPOSE 3306

CMD ["sh", "/script.sh"]