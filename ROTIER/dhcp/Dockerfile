FROM debian:latest

RUN apt-get update && \
    apt-get install -y isc-dhcp-server tcpdump --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/dhcp
RUN touch /var/lib/dhcp/dhcpd.leases && chmod 666 /var/lib/dhcp/dhcpd.leases

COPY dhcpd.conf /etc/dhcp/dhcpd.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
