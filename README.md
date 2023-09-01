# Paso 1. Configurar dominio

Ejecutamos este script que nos va a configurar nuestros archivos de configuración (valga la redundancia) con el dominio deseado y evitar hacerlo a mano.

```
chmod +x setup.sh
sh setup.sh
```

Introducimos un dominio, por ejemplo, `www.drorganvidez.com`


# Paso 2. Levantar los servicios con Docker Compose

Vamos a levantar un contenedor de Nginx y otro de Cerbot únicamente para generar el certificado a través del puerto 80

```
docker compose -f docker-compose.setup.yml up -d
```

Nos vamos al navegador y comprobamos que el mensaje "It works!" aparece tanto usando http como https

# Paso 3. Redirección de tráfico

Vamos a redirigir todo el tráfico entrante por el puerto 80 (http) al puerto 443 (https)

```
docker compose down
docker compose -f docker-compose.yml up -d
```

Nos vamos al navegador y comprobamos que nos redirige desde http a https y nos aparece de nuevo el mensaje "It works!"