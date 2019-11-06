#!/bin/bash

apt update
apt install python3-pip
apt update
pip3 install ansible
pip3 --version
ansible --version
cd /home/ubuntu/repo/playbooks
apt update
ansible-playbook java_install.yml -e "HOSTS=localhost"




