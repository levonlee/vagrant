# Vagrant + Docker Dev Environment

## Install the base Vagrant box first
Make sure you have installed vbguest plugin `vagrant plugin install vagrant-vbguest`
Use Vagrantfile-Base and run
`vagrant up`
`vagrant box add livagrantbox livagrantbox.box`
`vagrant destroy -f`

Use Vagrantfile from now on

## Start Dockers for a project
Put `docker-compose.yml` and db and files in `build/docker-compose/your-project-name`
In VM, go to `/vagrant/build/docker-compose` and run `docker-compose up -d`
In Windows, go to `http://192.168.33.10:8000`




