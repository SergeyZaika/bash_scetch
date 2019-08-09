#!/bin/bash

IP ()
{
echo "Debian first IPaddr enter:"
read First
echo "RadHat sacond IPaddr enter:"
read Sacond
}
IP

#ssh_config
{
echo "Host *"
echo ""
echo "Host First"
echo "HostName $First"
echo "User ubuntu"
echo "IdentityFile /etc/ssh/NEW.pem"
echo "Host Sacond"
echo "HostName $Sacond"
echo "User ubuntu"
echo "IdentityFile /etc/ssh/NEW.pem"
echo "Host $First"
echo "User ubuntu" 
echo "IdentityFile /etc/ssh/NEW.pem"
echo "Host $Sacond"
echo "User ubuntu"
echo "IdentityFile /etc/ssh/NEW.pem"
} > /etc/ssh/ssh_config

#ansible inventary hosts
{
echo "[debian]"
echo "First ansible_ssh_host=$First"
echo "[radhat]"
echo "Sacond ansible_ssh_host=$Sacond"
} > /etc/ansible/hosts

#ansible group_vars
rm -R /etc/ansible/group_vars
mkdir /etc/ansible/group_vars
touch /etc/ansible/group_vars/debian.yml /etc/ansible/group_vars/debian.yml
{
echo "---"
echo "ansible_ssh_user: ubuntu"
} > /etc/ansible/group_vars/debian.yml

touch /etc/ansible/group_vars/debian.yml /etc/ansible/group_vars/radhat.yml
{
echo "---"
echo "ansible_ssh_user: ec2-user"
} > /etc/ansible/group_vars/radhat.yml








