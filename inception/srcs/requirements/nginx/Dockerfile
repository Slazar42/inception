FROM debian:buster

# Install Nginx and OpenSSL
RUN apt update && apt install -y nginx openssl

# Copy the Nginx configuration file into the container
COPY nginx.conf /etc/nginx/nginx.conf

# Generate SSL certificates
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=Student/CN=localhost"

# Start Nginx in foreground mode
CMD ["nginx", "-g", "daemon off;"]
