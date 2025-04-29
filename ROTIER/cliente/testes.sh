#!/bin/bash

echo "==================== INÍCIO DOS TESTES ===================="

echo "[1] Verificando IP recebido via DHCP:"
ip a show eth0 | grep "inet "

echo -e "\n[2] Verificando rota padrão:"
ip route

echo -e "\n[3] Testando ping para roteador (172.20.2.7):"
ping -c 3 172.20.2.7

echo -e "\n[4] Testando ping para DNS (172.20.1.10):"
ping -c 3 172.20.1.10

echo -e "\n[5] Testando resolução DNS para web.intranet.local:"
dig web.intranet.local @172.20.1.10 +short

echo -e "\n[6] Testando acesso à página web via curl:"
curl -s http://web.intranet.local | head -n 10

echo -e "\n[7] Testando acesso ao serviço FTP (só porta, sem login):"
nc -zv ftp.intranet.local 21

echo -e "\n[8] Testando busca LDAP:"
ldapsearch -x -H ldap://172.20.1.18 -b dc=intranet,dc=local | head -n 10

echo "==================== FIM DOS TESTES ===================="
