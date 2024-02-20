FROM debian:latest

RUN apt-get update && apt-get install -y mariadb-server

COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/init.sql /
COPY ./tools/startup.sh /
COPY ./.env /

RUN chmod +x /startup.sh

EXPOSE 3306

CMD ["/startup.sh"]