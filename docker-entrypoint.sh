#!/bin/sh
set -e

# Inicia el keepalive en segundo plano
node /usr/src/app/keepalive.js &

# Inicia Nginx en primer plano (proceso principal del contenedor)
exec nginx -g "daemon off;"
