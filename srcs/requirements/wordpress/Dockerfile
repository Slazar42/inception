# Description: Dockerfile for setting up a WordPress container with required dependencies

# Use Debian Bullseye as the base image
FROM debian:bullseye

# Update package list and upgrade installed packages to the latest versions
RUN apt-get update && apt-get upgrade -y

# Install the necessary packages:
# - PHP (for WordPress execution)
# - PHP-FPM (FastCGI Process Manager for PHP)
# - MariaDB client (for database communication)
# - Sendmail (for sending emails from within the container)
# - PHP MySQL extension (for WordPress to interact with MySQL/MariaDB)
# - Curl (for making HTTP requests)
RUN apt-get install -y php php7.4-fpm mariadb-client sendmail php-mysql curl

# Copy the WordPress entrypoint script to the root directory inside the container
COPY ./entrypoint.sh /

# Grant execute permission to the entrypoint script
RUN chmod +x /entrypoint.sh

# Set the entrypoint for the container to run the custom script when it starts
ENTRYPOINT ["/entrypoint.sh"]
