#!/bin/bash

echo "[WEB] Inicializando container Web Server Apache..."

chmod 644 /var/www/html/index.html || true

echo "[WEB] IP atribuído ao container:"
ip a

echo "[WEB] Iniciando Apache em primeiro plano..."
exec /usr/sbin/apache2ctl -D FOREGROUND
