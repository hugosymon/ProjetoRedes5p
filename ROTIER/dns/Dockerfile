FROM ubuntu:latest

RUN apt-get update && apt-get install -y bind9 bind9utils bind9-doc dnsutils --no-install-recommends && rm -rf /var/lib/apt/lists/*

# COPY named.conf.options /etc/bind/named.conf.options # Removido: Usar volume mount no compose
# COPY db.intranet.local /etc/bind/db.intranet.local # Removido: Usar volume mount no compose
# COPY db.192.168.1 /etc/bind/db.192.168.1 # Removido: Usar volume mount no compose

EXPOSE 53/tcp 53/udp

# *** ATUALIZADO: CMD para usar o arquivo named.conf principal e flag -g ***
# Certifique-se de que named.conf inclui named.conf.options e named.conf.local
CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf"]