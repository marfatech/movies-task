FROM mysql:latest

COPY files/initial.sql.tpl /docker-entrypoint-initdb.d/init.sql.tpl
COPY files/mysql.cnf /etc/my.cnf.d/custom.cnf
COPY files/envsubst /usr/local/bin/envsubst

ARG MYSQL_USER
ARG MYSQL_DATABASE

ARG HOST_USER
ARG HOST_GROUP
ARG HOST_UID
ARG HOST_GID

USER root
#RUN chmod 777 -R /var/lib/mysql

RUN chmod +x /usr/local/bin/envsubst
RUN envsubst '${MYSQL_USER},${MYSQL_DATABASE}' < '/docker-entrypoint-initdb.d/init.sql.tpl' > '/docker-entrypoint-initdb.d/init.sql'

USER ${HOST_USER}
