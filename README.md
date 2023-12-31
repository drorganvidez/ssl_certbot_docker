# Paso 1. Configurar dominio y certificado

Ejecutamos este script que nos va a configurar nuestros archivos de configuración (valga la redundancia) con el dominio deseado y evitar hacerlo a mano.

```
chmod +x setup.sh && ./setup.sh
```

Introducimos un dominio, por ejemplo, `www.drorganvidez.com` y un email de administrador.

Una vez que confirmemos los cambios, el sistema nos generará unos archivos de certificado en la ruta `letsencrypt/live`


# Paso 2. Comprobar si funciona

Nos vamos al navegador y comprobamos que el mensaje "It works!" aparece tanto usando `http` como `https`. Todo el tráfico entrante al puerto 80 (http) se redirige automáticamente al puerto 443 (https)


# Paso 3. Renovación de certificado

Los certificados Let's Encrypt duran 90 días. Para renovarlo, ejecutamos

```
chmod +x renew.sh && ./renew.sh
```
