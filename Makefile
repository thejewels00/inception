all:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

up:
	docker-compose -f ./srcs/docker-compose.yml up


down:
	docker-compose -f ./srcs/docker-compose.yml down


fclean: down
	docker system prune -af && rm -drf /home/jchennak/data/wordpress/* && rm -rdf /home/jchennak/data/mariadb/* && docker volume rm db