FROM php:8.2-fpm-alpine

RUN apk add --no-cache nginx curl nodejs npm

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY websites /usr/share/nginx/html

EXPOSE 80

CMD sh -c "php-fpm -D && nginx -g 'daemon off;'"