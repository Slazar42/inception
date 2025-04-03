FROM debian:buster
RUN apt update && apt install -y mariadb-server
COPY my.cnf /etc/mysql/my.cnf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
