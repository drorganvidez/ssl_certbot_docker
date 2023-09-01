#!/bin/bash

echo "Introduce tu dominio (incluyendo el 'www' y el '.com' y el '.es' o la extensión que sea): "
read domain

# Sustituir el dominio placeholder en el archivo de configuración
sed -i "s/www.domain.com/$domain/g" ./nginx/default.conf
sed -i "s/www.domain.com/$domain/g" ./nginx/ssl.conf

echo "Configurado con el dominio $domain"