FROM php:8.2-fpm-alpine

# Instalar nginx + utilidades
RUN apk add --no-cache nginx curl nodejs npm

# Copiar config de nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiar sitios
COPY websites /usr/share/nginx/html

# Copiar scripts
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY keepalive.js /usr/src/app/keepalive.js

RUN sed -i 's/\r$//' /docker-entrypoint.sh && chmod +x /docker-entrypoint.sh

EXPOSE 80

CMD sh -c "php-fpm -D && nginx -g 'daemon off;'"
