#!/bin/bash

echo "Starting Jenkins backup! From host 000.000.000.000 to host 000.000.000.000 /usr/lib/jenkins/jenkins.war and /var/lib/jenkins (JENKINS_HOME) are copied"
echo "The backup will be located in /home/user/backup_jenkins. After 182 days, the backup will be deleted with the same script."


date=`date '+%Y%m%d'` # write date to variable
tar -cz /usr/lib/jenkins/jenkins.war | ssh user@000.000.000.000 "cat > /home/user/BackupJenkins/jenkins_backup_WAR$date.tar.gz"
sudo tar -cPz /var/lib/jenkins/ | ssh user@000.000.000.000 "cat > /home/user/BackupJenkins/jenkins_backup_HOME$date.tar.gz"
ssh user@000.000.000.000 "find /home/user/BackupJenkins -type f -mtime +120 -delete"


# ssh user@000.000.000.000 "find /home/path -type f -mtime +2 -delete"  # days
#ssh user@000.000.000.000 "find /home/path -type f -mmin +10 -delete   # minutes

#For the script to work correctly, it was necessary to run the tar command inside the script with sudo rights /var/lib/jenkins/...
# (there are files with 600 rights). To do this, the following was added at the end of the visudo (sudo visudo)
# file: user ALL=NOPASSWD: /usr/bin/tar  We allowed the user to launch the tar without entering the password sudo. 
