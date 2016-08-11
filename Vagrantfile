# -*- mode: ruby -*-
# vi: set ft=ruby :
ENV["LC_ALL"] = "en_US.UTF-8"
hostname = "livagrantdev"
cpus = 2
memory = 2048

@updateOS = <<SCRIPT
sudo apt-get update
sudo apt-get upgrade -y
SCRIPT

@ssh_config = <<SCRIPT
sudo -H -u vagrant bash -c "cp /vagrant/build/ssh/config ~/.ssh/config"
SCRIPT

Vagrant.configure(2) do |config|

  config.vm.box = "livagrantbox"
  config.vm.hostname = hostname

  config.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh"
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder "./build/docker", "/docker_builds", create: true, mount_options: ["ro"]

  config.vm.provider "virtualbox" do |vb|
    vb.name = hostname
    vb.memory = memory
    vb.cpus = cpus
  end

  config.vm.provision "updateOS", type: "shell", inline: @updateOS
  config.vm.provision "ssh_config", type: "shell", inline: @ssh_config

end
