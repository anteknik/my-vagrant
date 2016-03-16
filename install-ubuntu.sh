#!/bin/bash

# vagrant
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3_x86_64.deb
sudo dpkg -i vagrant_1.6.3_x86_64.deb

# install virtualbox
sudo add-apt-repository -y "deb http://download.virtualbox.org/virtualbox/debian trusty contrib"
wget http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc

# fingerprint should be 7B0F AB3A 13B9 0743 5925  D9C9 5442 2A4B 98AB 5139
gpg --with-fingerprint oracle_vbox.asc

sudo apt-key add oracle_vbox.asc

# verify key fingerprint would be a good idea
sudo apt-get -y update
sudo apt-get -y install virtualbox-4.3 dkms

