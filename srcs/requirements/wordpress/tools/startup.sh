#!/bin/sh

DB_HOST=mariadb
DB_USER=${DB_USERNAME1}
DB_PASS=${DB_PASSWORD1}
DB_NAME=${DB_NAME}

sed -i "s/'DB_NAME', ''/'DB_NAME', '$DB_NAME'/g" /var/www/html/wp-config.php
sed -i "s/'DB_USER', ''/'DB_USER', '$DB_USER'/g" /var/www/html/wp-config.php
sed -i "s/'DB_PASSWORD', ''/'DB_PASSWORD', '$DB_PASS'/g" /var/www/html/wp-config.php
sed -i "s/'DB_HOST', ''/'DB_HOST', '$DB_HOST'/g" /var/www/html/wp-config.php

until mysqladmin ping -h"$DB_HOST" -u"$DB_USER" -p"$DB_PASS" --silent; do
    echo 'Waiting for database connection...'
    sleep 1
done

if ! wp core is-installed --allow-root; then
    wp core install --url="aapenko.42.fr" --title="Lol" --admin_user="${DB_USERNAME1}" --admin_password="${DB_PASSWORD1}" --admin_email="sosi@xui.com" --allow-root
    wp user create ${DB_USERNAME2} sosi@jirniyxui.com --role=author --user_pass=${DB_PASSWORD2} --allow-root  
fi

exec php-fpm7.4 -F -R