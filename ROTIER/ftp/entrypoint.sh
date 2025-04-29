#!/bin/bash

echo "[FTP] Inicializando configuração do servidor FTP..."

# Garante que os diretórios existem
mkdir -p /home/vsftpd_users/usuario1
mkdir -p /home/vsftpd_users/usuario2

# Cria usuários se não existirem
if ! id usuario1 &>/dev/null; then
  useradd -d /home/vsftpd_users/usuario1 -s /usr/sbin/nologin usuario1
  echo "usuario1:123" | chpasswd
fi

if ! id usuario2 &>/dev/null; then
  useradd -d /home/vsftpd_users/usuario2 -s /usr/sbin/nologin usuario2
  echo "usuario2:123" | chpasswd
fi

# Ajusta permissões
chown -R usuario1:usuario1 /home/vsftpd_users/usuario1
chown -R usuario2:usuario2 /home/vsftpd_users/usuario2

echo "[FTP] Iniciando o vsftpd..."
exec /usr/sbin/vsftpd /etc/vsftpd.conf
