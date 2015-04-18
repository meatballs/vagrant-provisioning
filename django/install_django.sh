#!/usr/bin/env bash

# Assign the script arguments to meaningful variables
DJANGO_PROJECT=$1
DB_NAME=$2
DB_USER=$3
DB_PWD=$4

# install pip
apt-get install -y python-pip

# configure the django dev server as an upstart daemon
cp /vagrant/provision/django/django-server.conf /etc/init
sed -i "s/{{ project_name }}/$DJANGO_PROJECT/" /etc/init/django-server.conf
start django-server
