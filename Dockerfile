# Usa Nginx base
FROM nginx:alpine

# Copia tus proyectos al contenedor
COPY ./websites /usr/share/nginx/html

# Copia la configuración personalizada
COPY ./nginx.conf /etc/nginx/nginx.conf

# Expone el puerto HTTP
EXPOSE 80

# Comando por defecto
CMD ["nginx", "-g", "daemon off;"]
