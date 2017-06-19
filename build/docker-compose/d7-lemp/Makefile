.PHONY: info start stop restart enter deletedangling

info:
	@echo All Docker containers
	sudo docker ps -a
	@echo All Docker networks
	sudo docker network ls

start:
	sudo docker-compose up -d

stop:
	sudo docker-compose down -v

restart:
	- sudo docker-compose down -v
	- sudo docker-compose up -d

enter:
	sudo docker exec -it php bash -I

deletedangling:
	sudo docker rmi $$(sudo docker images -f "dangling=true" -q)
