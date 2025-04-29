#!/bin/sh

echo "[CLIENTE] Solicitando IP via DHCP..."
dhclient -v eth0

echo "[CLIENTE] Configurando DNS interno (172.20.1.10)..."
echo "nameserver 172.20.1.10" > /etc/resolv.conf

echo "[CLIENTE] Container pronto. Mantendo ativo..."

echo "[CLIENTE] Corrigindo rota padrão para usar o roteador (172.20.2.7)..."
ip route del default
ip route add default via 172.20.2.7 dev eth0

bash /root/testes.sh

tail -f /dev/null
