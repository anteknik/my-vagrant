# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.define "standalone" do |standalone|
    standalone.vm.hostname = "standalone"
    standalone.vm.network "forwarded_port", host: 27018, guest: 27018, id: "mongodb"

    standalone.vm.provision :puppet do |puppet|
      puppet.module_path = "modules"
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "standalone.pp"
    end

    standalone.vm.provision "shell", path: "loadzips.sh"

  end

  def config_zipset(config, node_number)
    config.vm.define "zipset#{node_number}" do |replica|
      replica.vm.box = "mongodb"
      replica.vm.hostname = "zipset#{node_number}"
      replica.vm.network "private_network", ip: "192.168.50.10#{node_number}"

      replica.vm.provision :puppet do |puppet|
        puppet.module_path = "modules"
        puppet.manifests_path = "manifests"
        puppet.manifest_file = "replicaset.pp"
      end
    end 
  end

  for node_number in 1..3
    config_zipset config, node_number
  end
end
