#!/bin/bash

echo "[DHCP] Iniciando servidor DHCP..."

# Garante que o arquivo de leases existe e tem permissão correta
touch /var/lib/dhcp/dhcpd.leases
chmod 666 /var/lib/dhcp/dhcpd.leases

# Inicia o serviço DHCPD na interface eth0
/usr/sbin/dhcpd -4 -cf /etc/dhcp/dhcpd.conf -pf /var/run/dhcpd.pid eth0

echo "[DHCP] DHCP Server operacional. Aguardando indefinidamente..."
tail -f /dev/null
