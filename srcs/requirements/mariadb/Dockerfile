FROM debian:latest

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/init.sql /
COPY ./tools/startup.sh /
COPY ./.env /

RUN chmod 777 /startup.sh

EXPOSE 3306

CMD ["/startup.sh"]