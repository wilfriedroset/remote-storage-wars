#! /bin/bash

# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-debian
# Using ansible repository because debian 10 is shipt with 2.7.7 which is quite old

echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' | sudo tee /etc/apt/sources.list.d/ansible.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

sudo apt-get update
sudo apt-get install -y ansible python3-apt
