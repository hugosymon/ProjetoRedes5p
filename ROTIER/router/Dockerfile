# Use Ubuntu como imagem base
FROM ubuntu:latest

# Instale ferramentas de rede necessárias e o Agente de Relé DHCP
# iproute2 para 'ip' command, iptables para firewall (futuro), isc-dhcp-relay para dhcrelay
RUN apt-get update && \
    apt-get install -y iproute2 iptables isc-dhcp-relay --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# No need to copy sysctl.conf, handled by command in docker-compose.yml
# No need to run sysctl -p, handled by command in docker-compose.yml

# CMD is ignored due to 'command:' set in docker-compose.yml
# CMD ["tail", "-f", "/dev/null"]