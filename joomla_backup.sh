#!/bin/bash

echo "Starting Joomla backup!"
date=`date '+%Y%m%d'`
tar -cPvz /var/www/html/joomla/ | ssh orangepi@0.0.0.0 "cat > /home/orangepi/joomla_backup/joomla_backup_HOME_$date.tar.gz"
# create ~/.my.cnf (permissions need to be 600). 
# Add this to the .my.cnf file
    #[mysqldump]
    #user=mysqluser
    #password=secret
mysqldump joomla > /home/ubuntu/MySQL_backup/joomla.sql & head -n 5 joomla.sql
tar -cz /home/ubuntu/MySQL_backup/joomla.sql | ssh orangepi@0.0.0.0 "cat > /home/orangepi/joomla_backup/joomla_backup_MySQL_$date.sql.tar.gz"
sudo tar -cz /etc/letsencrypt/ | ssh orangepi@0.0.0.0 "cat > /home/orangepi/joomla_backup/joomla_backup_letsencrypt_$date.sql.tar.gz"
ssh orangepi@0.0.0.0 "find /home/orangepi/joomla_backup -type f -mtime +120 -delete"



