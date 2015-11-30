Build a Vagrant box that has:
* Ubuntu Trust64
* Docker
* Docker image mysql
* Docker image wordpress
  
After that, you can repackage it into a new Vagrant box

`vagrant package --output mywordpress.box`

`vagrant box add mywordpressbox mywordpress.box`

`vagrant destroy -f`

`rm Vagrantfile`

`vagrant init mywordpressbox`

And then use this Vagrantfile

```
# -*- mode: ruby -*-
# vi: set ft=ruby :

@mysql = <<SCRIPT
mkdir -p /mydbdata
docker run --name wordpressdb -v=/vagrant/mydbdump:/tmp/mydbdump -v=/mydbdata:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=wordpress -d mysql:5.7.9
SCRIPT

@importmysql = <<SCRIPT
echo "docker run --rm -it -v /vagrant/mydbdump:/tmp/mydbdump"\
" --link wordpressdb:wpdb mysql:5.7.9 sh -c"\
" 'exec mysql"\
' -h"$WPDB_PORT_3306_TCP_ADDR" -P"$WPDB_PORT_3306_TCP_PORT"'\
' -uroot -p"$WPDB_ENV_MYSQL_ROOT_PASSWORD"'\
' wordpress < /tmp/mydbdump/pantheon_db.sql'\
"'" >> /home/vagrant/import_mysql.sh
chmod +x /home/vagrant/import_mysql.sh
SCRIPT

@wordpress = <<SCRIPT
docker run --name some-wordpress --link wordpressdb:mysql -p 8080:80 -d wordpress
SCRIPT

Vagrant.configure(2) do |config|

  config.vm.box = "mywordpressbox"
  config.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh"
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder "./", "/var/www/html"
  config.vm.provider "virtualbox" do |vb|
   vb.memory = "2048"
   vb.cpus = 2
  end

 config.vm.provision "shell", inline: @mysql
 config.vm.provision "shell", inline: @importmysql

end
```
