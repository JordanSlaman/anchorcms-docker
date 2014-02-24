#!/bin/bash

#If you'd preffer to use the anchor user than the root for mysql uncomment the anchor password lines.

if [ ! -f /mysql-root-pw.txt ]; then
  #mysql has to be started this way as it doesn't work to call from /etc/init.d
  /usr/bin/mysqld_safe & 
  sleep 10s

  # Here we generate random passwords (thank you pwgen!). 
  MYSQL_PASSWORD=`pwgen -c -n -1 12`
  #ANCHOR_PASSWORD=`pwgen -c -n -1 12`

  #This is so the passwords show up in logs. 
  echo mysql root password: $MYSQL_PASSWORD
  #echo mysql anchorcms password: $ANCHOR_PASSWORD
  echo $MYSQL_PASSWORD > /mysql-root-pw.txt
  #echo $ANCHOR_PASSWORD > /anchor-db-pw.txt

  mysqladmin -u root password $MYSQL_PASSWORD 
  mysql -uroot -p$MYSQL_PASSWORD -e "CREATE DATABASE anchor; GRANT ALL PRIVILEGES ON anchor.* TO 'anchor'@'localhost' IDENTIFIED BY '$ANCHOR_PASSWORD'; FLUSH PRIVILEGES;"
  killall mysqld
fi
# start all the services
/usr/local/bin/supervisord -n
