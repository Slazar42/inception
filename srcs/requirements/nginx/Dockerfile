# Description: Dockerfile for setting up Nginx with SSL and WordPress

# Use Debian Bullseye as the base image
FROM debian:bullseye

# Update package list and upgrade installed packages to the latest versions
RUN apt-get update && apt-get upgrade -y

# Install required packages: Nginx for web server and OpenSSL for SSL certificate generation
RUN apt-get install -y nginx openssl

# Create directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Generate a self-signed SSL certificate
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
    /etc/nginx/ssl/inception.key -subj "/C=MO/ST=TANGER/L=MED/O=1337/OU=1337/CN=slazar.42.fr/UID=slazar"

# Copy the custom Nginx configuration file from the host to the container
COPY ./nginx.conf /etc/nginx/nginx.conf

# Create the WordPress directory where the WordPress files will reside
RUN mkdir -p /var/www/wordpress

# Change ownership of the WordPress directory to the 'www-data' user and group (default for Nginx)
RUN chown -R www-data:www-data /var/www/wordpress

# Define the default command to run when the container starts (Nginx in the foreground)
CMD ["nginx", "-g", "daemon off;"]
