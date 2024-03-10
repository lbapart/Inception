FROM debian:latest

RUN apt-get update && \
    apt-get install -y nginx

# Remove default nginx configuration
RUN rm /etc/nginx/sites-enabled/default
RUN rm /etc/nginx/nginx.conf

COPY /requirements/nginx/conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]