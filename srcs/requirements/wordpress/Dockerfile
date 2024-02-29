FROM debian:latest

RUN apt-get update && \
    apt-get install -y wget \
    php7.3-fpm

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz && \
    mv wordpress /var/www/html/wordpress && \
    rm latest.tar.gz

COPY ./conf/wp-config.php /var/www/html/wordpress/
