FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/mysql/*

COPY conf/my.cnf /etc/mysql/my.cnf

COPY tools/wordpress.sql /etc/mysql/wordpress.sql

COPY tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld", "--user=mysql"]