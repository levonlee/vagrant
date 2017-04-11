.PHONY: default start stop restart ps killall deletedangling

default:
	@echo "make [command]. Available commands are:"
	@echo "start, stop, restart, deletedangling"

cppkg:
	cp /vagrant/li-nodejs/package.json .

start: cppkg
	docker-compose up -d --build

stop:
	docker-compose down -v

ps:
	docker ps -a

killall:
	docker rm -f $$(docker ps -a -q)

restart: cppkg
	docker-compose down -v && docker-compose up -d --build

deletedangling:
	docker rmi $$(docker images -f "dangling=true" -q)
