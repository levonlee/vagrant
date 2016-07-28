# -*- mode: ruby -*-
# vi: set ft=ruby :
ENV["LC_ALL"] = "en_US.UTF-8"

@updateOS = <<SCRIPT
sudo apt-get update
#sudo apt-get upgrade -y
SCRIPT

@docker = <<SCRIPT
curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker vagrant
SCRIPT

@wordpress = <<SCRIPT
sudo docker pull mysql:5.7.9
sudo docker pull wordpress
SCRIPT

@ssh_config = <<SCRIPT
sudo -H -u vagrant bash -c "cp /vagrant/build/ssh/config ~/.ssh/config"
SCRIPT

# curl -L https://github.com/docker/compose/releases/download/1.6.2/run.sh > /usr/local/bin/docker-compose
# curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
@docker_compose = <<SCRIPT
sudo curl -L https://github.com/docker/compose/releases/download/1.6.1/run.sh > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
SCRIPT

@test_docker_compose = <<SCRIPT
sudo -H -u vagrant bash -c "cp -r /vagrant/build/test_docker_compose ~/"
SCRIPT

@cleanup = <<SCRIPT
sudo apt-get clean
cat /dev/null > ~/.bash_history && history -c
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -rf /EMPTY && exit
SCRIPT

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh"
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true

  config.vm.network "private_network", ip: "192.168.33.10"

# config.vm.synced_folder "./", "/var/www/html"

  config.vm.provider "virtualbox" do |vb|
   vb.memory = "2048"
   vb.cpus = 2
  end

  config.vm.provision "updateOS", type: "shell", inline: @updateOS
  config.vm.provision "ssh_config", type: "shell", inline: @ssh_config
  config.vm.provision "docker", type: "docker" do |d|
    d.pull_images "mysql:5.7.9"
    d.pull_images "wordpress"
  end
# config.vm.provision "docker_compose", type: "shell", inline: @docker_compose
  config.vm.provision "test_docker_compose", type: "shell", inline: @test_docker_compose
#  config.vm.provision "docker_compose_plugin", type: "docker_compose", yml: "/home/vagrant/test_docker_compose/docker-compose.yml", run: "always"
  config.vm.provision "docker_compose_plugin", type: "docker_compose"

# config.vm.provision "shell", inline: @docker
# config.vm.provision "shell", inline: @wordpress
# config.vm.provision "shell", inline: @cleanup

end
