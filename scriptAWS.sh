#!/bin/bash

IP ()
{
echo "First IPaddr enter Debian:"
read First
echo "Sacond IPaddr enter RedHat:"
read Sacond
}
IP
# greate SSH connect ssh_config
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
# CREATE ansible hosts
{
echo "[Debian]"
echo "First ansible_ssh_host=$First"
echo "[RedHat]"
echo "Sacond ansible_ssh_host=$Sacond"
} > /etc/ansible/hosts

#del and add group_vars
rm -R /etc/ansible/group_vars
mkdir /etc/ansible/group_vars
touch /etc/ansible/group_vars/Debian.yml /etc/ansible/group_vars/RedHat.yml

#add ansible_ssh_user 
{
echo "---
ansible_ssh_user: ubuntu
"
} > /etc/ansible/group_vars/Debian.yml

{
echo "---
ansible_ssh_user: ec2-user
"
} > /etc/ansible/group_vars/RedHat.yml






