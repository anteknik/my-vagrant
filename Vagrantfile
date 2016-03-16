# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  
  
  def provisioning(config, shell_arguments)
    config.vm.provision "shell", path: "provision.sh", args: shell_arguments
  end

  excludes = [".git/","myhubot/node_modules"]
  config.vm.synced_folder ".", "/vagrant", type: "rsync" , rsync__exclude: excludes, rsync_excludes: excludes

  config.vm.define "dev" do |dev|
    dev.vm.box = "ubuntu/trusty64"
    dev.vm.hostname = "hubot-dev"

    provisioning(dev, ["dev", "vagrant"])
  end    

  config.vm.define "prod" do |prod|
    prod.vm.box = "dummy"
    
    provisioning(prod, ["prod", "ubuntu"])
    
    prod.vm.provider "aws" do |aws, override|
      aws.region_config "us-west-2", :ami => "ami-835826b3"
      aws.region_config "us-west-1", :ami => "ami-ab7070ee"
      aws.region = "us-west-2"

      aws.tags = {
       'Name' => 'Hubot'
      }

      override.ssh.username = "ubuntu"
      aws.keypair_name = "hubot"
      override.ssh.private_key_path = "~/.ssh/hubot.pem"

      aws.access_key_id = "YOUR KEY"
      aws.secret_access_key = "YOUR KEY"

    end
  end

end
