FROM debian:buster

RUN apt-get update && apt-get install -y apt-transport-https lsb-release ca-certificates wget curl
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

RUN apt-get update -y && apt-get install -y \
    wget \
    curl \
    php7.4 \
    php7.4-fpm \
    php7.4-curl \
    php7.4-mysqli \
    php7.4-gd \
    php7.4-mbstring \
    php7.4-json \
    php7.4-zip \
    php7.4-exif \
    php7.4-xml \
    mariadb-client

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz; \
    tar -xvzf latest.tar.gz; \
    rm latest.tar.gz; \
    cp -r wordpress/* .; \
    rm -rf wordpress, latest.tar.gz;

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY /requirements/wordpress/conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY /requirements/wordpress/conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf

RUN mkdir -p /run/php

COPY /requirements/wordpress/tools/config.sh .

COPY /requirements/wordpress/conf/wp-config.php /var/www/html/wp-config.php
COPY /requirements/wordpress/tools/startup.sh /var/www/html/startup.sh
RUN chmod 777 /var/www/html/startup.sh

CMD ["sh", "startup.sh"]