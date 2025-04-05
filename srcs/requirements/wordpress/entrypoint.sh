#!/bin/bash
#--------------------------------------------------- WordPress Installation ---------------------------------------------------#
# Install WP-CLI (WordPress Command Line Interface)
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# Make the WP-CLI script executable
chmod +x wp-cli.phar
# Move WP-CLI to the /usr/local/bin directory for global access
mv wp-cli.phar /usr/local/bin/wp
# Navigate to the WordPress installation directory
cd /var/www/wordpress
# Set correct permissions for the WordPress directory
chmod -R 755 /var/www/wordpress/
# Change ownership of the WordPress directory to the 'www-data' user (default web user for Nginx/Apache)
chown -R www-data:www-data /var/www/wordpress
#--------------------------------------------------- WordPress Core Installation ---------------------------------------------------#
# Download the latest WordPress core files using WP-CLI
wp core download --allow-root
# Generate the wp-config.php file with database credentials
wp core config --dbhost=mariadb:3306 --dbname="$MYSQL_DB" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root 
# Install WordPress with the given site URL, title, admin credentials, and email
wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_N" --admin_password="$WP_ADMIN_P" --admin_email="$WP_ADMIN_E" --allow-root
# Create a new WordPress user with the specified username, email, password, and role
wp user create "$WP_U_NAME" "$WP_U_EMAIL" --user_pass="$WP_U_PASS" --role="$WP_U_ROLE" --allow-root
#--------------------------------------------------- PHP Configuration ---------------------------------------------------#
# Update PHP-FPM configuration to listen on port 9000 instead of the default Unix socket
sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
# Create a directory for PHP-FPM runtime (necessary for proper PHP-FPM operation)
mkdir -p /run/php
# Start PHP-FPM service in the foreground to keep the container running
/usr/sbin/php-fpm7.4 -F