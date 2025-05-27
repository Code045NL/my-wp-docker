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

WP_DATABASE_NAME=$INSTALL_NAME
WP_DATABASE_USER=dbusr
WP_DATABASE_PASS=DBPass001!
PORT=3306
HOST=server_mariadb

WP_PREFIX=wp_

TITEL="Mijn WordPress Site $INSTALL_NAME"
ADMIN_EMAIL=maurice@code045.nl
ADMIN_USER=Maurice
ADMIN_PASS=Code001!
DOMAIN=http://$PRIMARYDOMAIN
EOL

echo ".env bestand gemaakt voor $INSTALL_NAME"
