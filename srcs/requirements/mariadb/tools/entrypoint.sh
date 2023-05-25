#!/bin/sh
set -e

if [ ! -d /var/lib/mysql/mysql ]; 
then
    mysql_install_db --user=mysql
fi

service mariadb start

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 
    echo "Database already exists"
else
    echo "Creating $MYSQL_DATABASE Database"
    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root
fi

if [ "$MYSQL_ROOT_PASSWORD" ]; 
then
    echo "Setting up root password"
    echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;" | mysql -u root
fi

service mariadb stop

exec "$@"