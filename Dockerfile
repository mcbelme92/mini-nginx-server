FROM nginx:alpine

# Actualizar paquetes base
RUN apk update && apk upgrade

# Copiar configuración personalizada de Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiar tus sitios web
COPY websites /usr/share/nginx/html

# Copiar scripts
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY keepalive.js /usr/src/app/keepalive.js

# Convertir saltos de línea y dar permisos de ejecución
RUN sed -i 's/\r$//' /docker-entrypoint.sh && chmod +x /docker-entrypoint.sh

# Instalar Node.js para el keepalive
RUN apk add --no-cache curl nodejs npm

# Exponer puerto
EXPOSE 80

# Punto de entrada principal (forma correcta)
ENTRYPOINT ["/docker-entrypoint.sh"]
