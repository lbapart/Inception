FROM debian:latest

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

COPY requirements/mariadb/conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY requirements/mariadb/tools/startup.sh /


RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

RUN rm -R /var/lib/mysql/*

RUN chmod 777 /startup.sh

USER mysql

CMD /startup.sh && mysqld