#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 install-name (bijv. install-1)"
  exit 1
fi

INSTALL_NAME=$1
INSTALL_PATH="/home/wp-core/$INSTALL_NAME"

cat > code/.env <<EOL
WORDPRESS_ROOT=/home/wp-core
WORDPRESS_CONTENT=$INSTALL_PATH/wp-content

WP_DATABASE_NAME=wpdb_$INSTALL_NAME
WP_DATABASE_USER=wpuser
WP_DATABASE_PASS=secretpass
PORT=3306
HOST=db

WP_PREFIX=wp_

TITEL="Mijn WordPress Site $INSTALL_NAME"
ADMIN_EMAIL=admin@example.com
ADMIN_USER=admin_$INSTALL_NAME
ADMIN_PASS=strongpassword
DOMAIN=http://$INSTALL_NAME.local
EOL

echo ".env bestand gemaakt voor $INSTALL_NAME"
