.PHONY: info rdevdbdump localgetdb

# remote dev container name
rdevc=remote-dev-container-name

# remote dev code root
rdevdir=/var/www/html/path/to/remote/dev/code/

# remote dev db name
rdevdbname=remote_dev_db_name

# remote dev db dump place relative to code root
rdevdbdumpdir=$(rdevdir)cs-devops/db/

# remote dev db user
rdevdbu=root

# remote dev db password
rdevdbp=rootpassword

# remote dev host appeared on local ~/.ssh/config
rdevhost=remote_host_name

info:
	cat Makefile

# mysql dump on remote dev
rdevdbdump:
	sudo docker exec $(rdevc) sh -c 'exec mysqldump -u$(rdevdbu) -p"$(rdevdbp)" $(rdevdbname)' > $(rdevdbdumpdir)$(rdevdbname).sql

# download from remote dev sql file to local

localgetdb:
	scp $(rdevhost):$(rdevdbdumpdir)$(rdevdbname).sql ./

