Build a Vagrant box that has:
# Ubuntu 14.04
# Docker
# Docker image mysql
# Docker image wordpress
  
After that, you can repackage it into a new Vagrant box

docker run --name wordpressdb -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=wordpress -d mysql:5.7.9
docker run --name some-wordpress --link wordpressdb:mysql -p 8080:80 -d wordpress
