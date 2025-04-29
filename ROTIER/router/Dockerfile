FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y iproute2 iptables isc-dhcp-relay --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
