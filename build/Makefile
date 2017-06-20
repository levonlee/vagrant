.PHONY: info cleanup

info:
	@echo All Docker containers
	sudo docker ps -a
	@echo All Docker networks
	sudo docker network ls
	@echo All Docker volumes
	sudo docker network ls

cleanup:
	- docker rm $$(docker ps -qa --no-trunc --filter "status=exited")
	- docker volume rm $$(docker volume ls -qf dangling=true)
	- docker network rm $$(docker network ls | grep "bridge" | awk '/ / { print $$1 }')
	- docker rmi $$(docker images --filter "dangling=true" -q --no-trunc)
	- docker rmi $$(docker images | grep "none" | awk '/ / { print $$3 }')
