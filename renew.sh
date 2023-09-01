#!/bin/bash

docker compose -f docker-compose.setup.yml run certbot renew --webroot --webroot-path=/var/www
