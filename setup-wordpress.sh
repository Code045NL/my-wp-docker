#!/bin/bash
set -e

export $(grep -v '^#' /code/.env | xargs)

WP_PATH="/var/www/html"
WP_CONFIG_PATH="$WP_PATH/wp-config.php"

echo "Maak wp-config.php aan in $WP_CONFIG_PATH"

cat > "$WP_CONFIG_PATH" <<EOL
<?php
define('DB_NAME', '${WP_DATABASE_NAME}');
define('DB_USER', '${WP_DATABASE_USER}');
define('DB_PASSWORD', '${WP_DATABASE_PASS}');
define('DB_HOST', '${HOST}:${PORT}');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

\$table_prefix = '${WP_PREFIX}';

define('WP_DEBUG', false);

if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
EOL

echo "wp-config.php is aangemaakt."

if ! wp core is-installed --path="$WP_PATH" --allow-root; then
  echo "WordPress is nog niet geïnstalleerd, installeren..."
  wp core install \
    --path="$WP_PATH" \
    --url="$DOMAIN" \
    --title="$TITEL" \
    --admin_user="$ADMIN_USER" \
    --admin_password="$ADMIN_PASS" \
    --admin_email="$ADMIN_EMAIL" \
    --skip-email \
    --allow-root
  echo "WordPress is geïnstalleerd."
else
  echo "WordPress is al geïnstalleerd."
fi

exec apache2-foreground
