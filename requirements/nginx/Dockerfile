FROM debian:latest

RUN apt-get update && \
    apt-get install -y nginx openssl

# Remove default nginx configuration
RUN rm /etc/nginx/sites-enabled/default

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/

# todo: replace cert files
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/server.key \
    -out /etc/ssl/certs/server.crt \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=aapenko.42.fr"

RUN chmod 777 /var/www/html;

RUN chmod 777 /var/www/html/index.nginx-debian.html;

EXPOSE 443 9000

CMD ["nginx", "-g", "daemon off;"]