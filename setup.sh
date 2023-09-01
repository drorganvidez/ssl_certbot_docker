#!/bin/bash

while true; do
    # Solicita dominio y email
    echo "Introduce tu dominio (incluyendo el 'www' y el '.com' o '.es' o la extensión que sea). Ejemplo: www.drorganvidez.com"
    read domain

    echo "Introduce tu email: "
    read email

    # Muestra un resumen de lo ingresado y solicita confirmación
    echo "Configurado con el dominio $domain"
    echo "Configurado con el email $email"
    echo ""
    echo "¿Estás seguro de que la información ingresada es correcta? [y/n]"
    read confirm

    # Si el usuario confirma, rompe el bucle y continua con el script. Si no, repite el bucle.
    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
        break
    else
        echo "Por favor, reintroduce los datos."
        echo ""
    fi
done

# Sustituir el dominio placeholder en el archivo de configuración
sed -i "s/www.domain.com/$domain/g" ./nginx/default.conf
sed -i "s/www.domain.com/$domain/g" ./nginx/ssl.conf

# Levantamos contenedor de Nginx
docker compose -f docker-compose.setup.yml up -d nginx

# Generamos certificado
docker-compose -f docker-compose.setup.yml run certbot certonly --webroot --webroot-path=/var/www -d $domain --email $email --agree-tos --no-eff-email --force-renewal
