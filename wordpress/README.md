Build a Vagrant box using this Vagrantfile:
* Ubuntu Trust64
* Docker
* Docker image mysql:5.7.9
* Docker image wordpress
  
After that, you can repackage it into a new Vagrant box

`vagrant package --output mywordpress.box`

`vagrant box add mywordpressbox mywordpress.box`

`vagrant destroy -f`

`rm Vagrantfile`

And then setup another Vagrantfile (in project folder) for booting up the VM.
