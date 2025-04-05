# Description: Dockerfile for setting up a MariaDB server in a Debian-based container

# Use Debian Bullseye as the base image
FROM debian:bullseye

# Update package list and upgrade installed packages to the latest versions
RUN apt-get update && apt-get upgrade -y

# Install MariaDB server and netcat (for networking utilities)
RUN apt-get install -y mariadb-server netcat

# Copy the custom entrypoint script from the host to the container's root directory
COPY ./entrypoint.sh /entrypoint.sh

# Grant execute permission to the entrypoint script
RUN chmod +x /entrypoint.sh

# Set the entrypoint for the container to run the custom script when the container starts
ENTRYPOINT ["/entrypoint.sh"]
