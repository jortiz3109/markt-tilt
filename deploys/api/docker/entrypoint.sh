#! /bin/sh
set -e

DIR=/var/www/html/vendor
if [ ! -d "$DIR" ]; then
    composer install
fi

FILE=/var/www/html/vendor/autoload.php
if [ ! -f "$FILE" ]; then
    composer dump-autoload --optimize
fi

find storage -type d -print0 | xargs -0 chmod 775
find storage -type f -print0 | xargs -0 chmod 664

sleep 4

echo "Starting $@"
exec "$@"
