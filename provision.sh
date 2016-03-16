#!/bin/bash

apt-get -y update

dpkg -s npm &>/dev/null || {
  apt-get -y install nodejs npm
  ln -s /usr/bin/nodejs /usr/bin/node
}

command -v hubot &>/dev/null || {
  npm install -g hubot coffee-script
}

dpkg -s libicu-dev &>/dev/null || {
  apt-get -y install libexpat1-dev libicu-dev
}

cp /vagrant/upstart/myhubot.conf /etc/init/myhubot.conf

sudo -u vagrant -i sh -c 'cd /vagrant/myhubot; npm install'

service myhubot restart
