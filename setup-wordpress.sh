#!/bin/bash
set -e

# Load .env variables
export $(grep -v '^#' .env | xargs)

CODE_DIR="/code"
WP_CONFIG_PATH="$CODE_DIR/wp-config.php"

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

/* That's all, stop editing! Happy blogging. */

if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
EOL

echo "wp-config.php is aangemaakt."

# Check of wp core al is geïnstalleerd
if ! wp core is-installed --path="$CODE_DIR" --allow-root; then
    echo "WordPress nog niet geïnstalleerd, installatie starten..."

    wp core install \
        --path="$CODE_DIR" \
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
