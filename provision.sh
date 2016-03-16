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
machine=$1
cp /vagrant/upstart/myhubot.$machine.override /etc/init/myhubot.override

run_as_user=$2
sudo -u $run_as_user -i sh -c 'cd /vagrant/myhubot; npm install'

service myhubot restart
