FROM php:8.2-fpm-alpine

# Instalar solo lo necesario
RUN apk add --no-cache nginx curl

# Configuración de nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# Sitios (HTML + PHP)
COPY websites /usr/share/nginx/html

EXPOSE 80

# Arranque correcto para Render
CMD sh -c "php-fpm -D && nginx -g 'daemon off;'"
