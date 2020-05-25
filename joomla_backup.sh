#!/bin/bash

echo "Starting Joomla backup!"
date=`date '+%Y%m%d'`
tar -cPz /var/www/html/joomla/ | ssh orangepi@000.000.000.000 "cat > /home/orangepi/joomla_backup/joomla_backup_HOME_date.tar.gz"
# create ~/.my.cnf (permissions need to be 600). 
# Add this to the .my.cnf file
    #[mysqldump]
    #user=mysqluser
    #password=secret
cd /home/ubuntu/MySQL_backup & mysqldump joomla > joomla.sql & head -n 5 joomla.sql
tar -cPz /home/ubuntu/MySQL_backup/joomla.sql | ssh orangepi@000.000.000.000  "cat > /home/orangepi/joomla_backup/joomla_backup_MySQL_$date.sql.tar.gz"




