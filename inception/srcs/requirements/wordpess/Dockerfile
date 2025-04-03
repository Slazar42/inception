FROM debian:buster
RUN apt update && apt install -y php php-mysql wget
RUN wget https://wordpress.org/latest.tar.gz && tar -xvzf latest.tar.gz
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]