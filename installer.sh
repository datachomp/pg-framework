#!/bin/bash
echo "Get the basics"

sudo apt-get -y install software-properties-common python-software-properties
sudo apt-get -y install curl git-core
sudo apt-get -y install p7zip-rar p7zip-full

sudo echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -

sudo apt-get update
sudo apt-get install pgdg-keyring

sudo apt-get update

sudo apt-get -y install memcached
sudo apt-get -y install redis-server
sudo apt-get -y install postgresql-9.3
sudo apt-get -y install postgresql-9.3-plv8
sudo apt-get -y install postgresql-9.3-pgmemcache
sudo apt-get -y install postgresql-contrib-9.3


sudo ufw enable
sudo ufw allow 5432  #pg
sudo ufw allow 6379
sudo ufw allow 11212 #memcached

sudo ln -nfs configs/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
sudo ln -nfs configs/postgresql.conf /etc/postgresql/9.3/main/postgresql.conf
sudo ln -nfs configs/redis.conf /etc/redis/redis.conf

echo "horray!"
exit 0
