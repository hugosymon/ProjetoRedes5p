#!/bin/bash

echo "[ROUTER] Habilitando IP Forward..."
sysctl -w net.ipv4.ip_forward=1

echo "[ROUTER] Limpando regras NAT antigas..."
iptables -t nat -F

echo "[ROUTER] Aplicando SNAT apenas para rede clientes (172.20.2.0/24)..."
iptables -t nat -A POSTROUTING -s 172.20.2.0/24 -o eth1 -j MASQUERADE

echo "[ROUTER] Aplicando regras de Firewall..."

# Política padrão: Bloquear tudo
iptables -P FORWARD DROP

# Permitir tráfego interno:
iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT

# Permitir DNS (porta 53 TCP/UDP)
iptables -A FORWARD -p tcp --dport 53 -j ACCEPT
iptables -A FORWARD -p udp --dport 53 -j ACCEPT

# Permitir DHCP (porta 67/68 UDP)
iptables -A FORWARD -p udp --dport 67:68 -j ACCEPT

# Permitir HTTP (porta 80) e HTTPS (porta 443)
iptables -A FORWARD -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp --dport 443 -j ACCEPT

# Permitir FTP (porta 21 e passivas 20000-21000)
iptables -A FORWARD -p tcp --dport 21 -j ACCEPT
iptables -A FORWARD -p tcp --dport 20000:21000 -j ACCEPT

# Permitir SAMBA (portas 137-139 e 445)
iptables -A FORWARD -p tcp --dport 139 -j ACCEPT
iptables -A FORWARD -p tcp --dport 445 -j ACCEPT
iptables -A FORWARD -p udp --dport 137:138 -j ACCEPT

# Permitir LDAP (389 TCP/UDP, 636 TCP)
iptables -A FORWARD -p tcp --dport 389 -j ACCEPT
iptables -A FORWARD -p udp --dport 389 -j ACCEPT
iptables -A FORWARD -p tcp --dport 636 -j ACCEPT

# (Opcional) Liberar ICMP (ping)
iptables -A FORWARD -p icmp -j ACCEPT

echo "[ROUTER] Firewall aplicado com sucesso."

# Iniciar o DHCP Relay para clientes
echo "[ROUTER] Iniciando DHCP Relay Agent..."
/usr/sbin/dhcrelay -i eth0 172.20.1.12

# Manter o container rodando
tail -f /dev/null
