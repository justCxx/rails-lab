# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "rails-lab-vm"
  config.vm.box_check_update = false

  config.ssh.forward_agent = true

  config.vm.network "forwarded_port", guest: 3000, host: 3000 # rails server
  config.vm.network "forwarded_port", guest: 1080, host: 1080 # mailcatcher
  config.vm.network "private_network", type: "dhcp"

  config.vm.synced_folder ".", "/home/vagrant/app", type: "nfs"

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "1"
    vb.memory = "1024"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "cm/vagrant.yml"
  end
end
