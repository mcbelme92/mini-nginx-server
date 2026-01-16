FROM php:8.2-fpm-alpine

RUN apk add --no-cache nginx nodejs npm curl

WORKDIR /app
COPY server.js .

RUN npm init -y && npm install express

COPY nginx.conf /etc/nginx/nginx.conf
COPY websites /usr/share/nginx/html

EXPOSE 80

CMD sh -c "php-fpm -D && node /app/server.js & nginx -g 'daemon off;'"
