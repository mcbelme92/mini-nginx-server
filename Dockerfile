FROM nginx:alpine

# Update all packages to their latest versions to reduce vulnerabilities
RUN apk update && apk upgrade

# Copiar configuración personalizada de Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiar tus sitios web
COPY websites /usr/share/nginx/html

# Copiar scripts
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY keepalive.js /usr/src/app/keepalive.js

# Dar permisos de ejecución e instalar Node.js para ejecutar el keepalive
RUN chmod +x /docker-entrypoint.sh && apk add --no-cache curl nodejs npm

# Exponer puerto 80 (Render lo detectará)
EXPOSE 80

# __define-ocg__ punto de entrada con exec form
CMD ["/docker-entrypoint.sh"]
