FROM debian:latest

RUN apt-get update && \
    apt-get install -y nginx

# Remove default nginx configuration
RUN rm /etc/nginx/sites-enabled/default
RUN rm /etc/nginx/nginx.conf

RUN chmod 777 /var/www/html;

RUN chmod 777 /var/www/html/index.nginx-debian.html;

EXPOSE 443 9000

CMD ["nginx", "-g", "daemon off;"]