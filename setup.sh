#!/bin/bash

echo "Introduce tu dominio (incluyendo el 'www' y el '.com' y el '.es' o la extensión que sea): "
read domain

echo "Introduce tu email: "
read email

# Sustituir el dominio placeholder en el archivo de configuración
sed -i "s/www.domain.com/$domain/g" ./nginx/default.conf
sed -i "s/www.domain.com/$domain/g" ./nginx/ssl.conf

echo "Configurado con el dominio $domain"
echo "Configurado con el email $email"

# Levantamos contenedor de Nginx

docker compose -f docker-compose.setup.yml up -d nginx

docker compose run certbot certonly --webroot --webroot-path=/var/www/certbot -d $domain --email $email --agree-tos --no-eff-email --force-renewal