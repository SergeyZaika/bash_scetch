#!/bin/bash

IP ()
{
echo "First IPaddr enter Debian:"
read First
echo "Sacond IPaddr enter RedHat:"
read Sacond
}
IP
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

{
echo "[Debian]"
echo "First ansible_ssh_host=$First"
echo "[RedHat]"
echo "Sacond ansible_ssh_host=$Sacond"
} > /etc/ansible/hosts







