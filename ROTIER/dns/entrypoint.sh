#!/bin/bash

echo "[DNS] Adicionando rota para a rede clientes via router..."
ip route add 172.20.2.0/24 via 172.20.1.7

echo "[DNS] Iniciando serviço BIND9..."
/usr/sbin/named -g -c /etc/bind/named.conf
