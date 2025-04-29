#!/bin/bash

echo "[SAMBA] Inicializando container Samba Server..."

# Exibe IPs para debug
echo "[SAMBA] IP atribuído ao container:"
ip a

# Ajusta permissões do diretório compartilhado
echo "[SAMBA] Ajustando permissões em /srv/samba_share..."
mkdir -p /srv/samba_share
chmod -R 777 /srv/samba_share

# Reinicia o serviço smbd (servidor de arquivos Samba)
echo "[SAMBA] Iniciando o serviço smbd em primeiro plano..."
exec /usr/sbin/smbd -F --no-process-group
