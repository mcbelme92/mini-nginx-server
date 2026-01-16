FROM php:8.2-fpm-alpine

RUN apk add --no-cache nginx nodejs npm curl

# PHP + Nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY websites /usr/share/nginx/html

# Node
WORKDIR /app
COPY node ./node
RUN cd node && npm init -y && npm install express

EXPOSE 80

CMD sh -c "php-fpm -D && node /app/node/server.js & nginx -g 'daemon off;'"
