FROM nginx:alpine

# 1️⃣  Actualizar paquetes base
RUN apk update && apk upgrade

# 2️⃣  Copiar configuración de Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 3️⃣  Copiar sitios web (React build)
COPY websites /usr/share/nginx/html

# 4️⃣  Copiar scripts auxiliares
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY keepalive.js /usr/src/app/keepalive.js

# 5️⃣  Normalizar saltos de línea y permisos
RUN sed -i 's/\r$//' /docker-entrypoint.sh && chmod +x /docker-entrypoint.sh

#
RUN apk add --no-cache nodejs npm curl

# 7️⃣  Exponer puerto
EXPOSE 80

# 8️⃣  Entry point del contenedor
ENTRYPOINT ["/docker-entrypoint.sh"]
