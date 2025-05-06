FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    isc-dhcp-client \
    iputils-ping \
    dnsutils \
    curl \
    netcat \
    ldap-utils && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
COPY testes.sh /root/testes.sh
RUN chmod +x /entrypoint.sh /root/testes.sh

ENTRYPOINT ["/entrypoint.sh"]
