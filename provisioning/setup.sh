#!/bin/bash

echo "Memulai provisioning"

echo "Setup Software Sources"
cp /vagrant/provisioning/config/sources.list /etc/apt/sources.list
cp /vagrant/provisioning/config/environment /etc/environment

apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y

echo "Instalasi Git"
apt-get install -y git

echo "Install Java"
wget --no-check-certificate https://github.com/aglover/ubuntu-equip/raw/master/equip_java7_64.sh && bash equip_java7_64.sh

echo "Install Maven"
apt-cache search maven
apt-get install -y maven

echo "Updating PHP repository"
apt-get install python-software-properties build-essential -y > /dev/null
add-apt-repository ppa:ondrej/php5 -y > /dev/null
apt-get update > /dev/null
	
echo "Installing PHP"
apt-get install php5-common php5-dev php5-cli php5-fpm -y > /dev/null
    
echo "Installing PHP extensions"
apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql -y > /dev/null

echo "Setup MySQL"
apt-get install -y debconf-utils

debconf-set-selections <<< "mysql-server mysql-server/root_password password admin"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password admin"

apt-get install -y mysql-server

echo "Install Composer"
curl -sS https://getcomposer.org/installer | php
mv /home/vagrant/composer.phar /usr/local/bin/composer

echo "Install Codeception"
curl -LsS http://codeception.com/codecept.phar -o /usr/local/bin/codecept
chmod a+x /usr/local/bin/codecept

echo "Selesai provisioning"
