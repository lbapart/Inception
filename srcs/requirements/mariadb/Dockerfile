FROM debian:latest

ARG DB_NAME \
    DB_ROOT_PASSWORD \
    DB_USERNAME1 \
    DB_PASSWORD1

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

COPY requirements/mariadb/conf/mariadb.cnf /etc/my.cnf.d/docker.cnf
COPY requirements/mariadb/tools/init.sql /
COPY requirements/mariadb/tools/startup.sh /

RUN sed -i "s|skip-networking|networking=1|g" /etc/my.cnf.d/docker.cnf

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

RUN rm -R /var/lib/mysql/*

RUN chmod 777 /startup.sh

RUN sh /startup.sh

EXPOSE 3306

USER mysql

CMD ["mysqld"]