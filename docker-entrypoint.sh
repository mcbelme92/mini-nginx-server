#!/bin/sh
set -e

# Arranca PHP-FPM en background
php-fpm -D

# (Opcional) keepalive
node /usr/src/app/keepalive.js &

# Arranca nginx en foreground
exec nginx -g "daemon off;"
