#!/bin/bash
mkdir -p /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql
mysql_install_db --user=root --datadir=/var/lib/mysql
echo "INIT DB DONE"
cat << eof > /tmp/init.sql
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User = '';
DELETE FROM mysql.db WHERE Db = 'test';
DELETE FROM mysql.user WHERE User = 'root' AND Host NOT IN ('localhost');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USERNAME1}'@'%' IDENTIFIED BY '${DB_PASSWORD1}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USERNAME1}'@'%' IDENTIFIED BY '${DB_PASSWORD1}';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${DB_PASSWORD1}' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${DB_PASSWORD1}' WITH GRANT OPTION;
FLUSH PRIVILEGES;
eof
mysqld --user=root --bootstrap < /tmp/init.sql
