#!/bin/bash

IP ()
{
echo "First IPaddr enter:"
read First
echo "Sacond IPaddr enter:"
read Sacond
}
IP
{
echo "Host *"
echo ""
echo "Host First"
echo "HostName $First"
echo "User ubuntu"
echo "IdentityFile /etc/ssh/Sacond.pem"
echo "Host Sacond"
echo "HostName $Sacond"
echo "User ubuntu"
echo "IdentityFile /etc/ssh/Sacond.pem"
echo "Host $First"
echo "User ubuntu"
echo "IdentityFile /etc/ssh/Sacond.pem"
echo "Host $Sacond"
echo "User ubuntu"
echo "IdentityFile /etc/ssh/Sacond.pem"
} > /etc/ssh/ssh_config

{
echo "[servers]"
echo "First ansible_ssh_host=$First"
echo "Sacond ansible_ssh_host=$Sacond"
} > /etc/ansible/hosts







