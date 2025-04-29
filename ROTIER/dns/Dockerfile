FROM ubuntu:latest

# Instalar Bind9, dnsutils (útil para testes) e iproute2 (comando ip)
RUN apt-get update && \
    apt-get install -y bind9 dnsutils iproute2 && \
    rm -rf /var/lib/apt/lists/*

# Copiar arquivos de configuração de DNS
COPY named.conf.options /etc/bind/named.conf.options
COPY named.conf.local /etc/bind/named.conf.local
COPY db.intranet.local /etc/bind/db.intranet.local
COPY db.172.20.1 /etc/bind/db.172.20.1
COPY db.2.20.172 /etc/bind/db.2.20.172

# Copiar o entrypoint customizado
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Definir o script de entrada
ENTRYPOINT ["/entrypoint.sh"]
