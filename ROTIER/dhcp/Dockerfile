# Use Debian como imagem base (última tentativa com esta base)
FROM debian:latest

# Instale o servidor DHCP
RUN apt-get update && \
    apt-get install -y isc-dhcp-server --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Create the directory for the lease file
RUN mkdir -p /var/lib/dhcp

# Create an empty leases file with the right permissions
RUN touch /var/lib/dhcp/dhcpd.leases && chmod 666 /var/lib/dhcp/dhcpd.leases

# Copy your DHCP config into the container
COPY dhcpd.conf /etc/dhcp/dhcpd.conf

# Run the DHCP server in background AND keep container alive with tail -f /dev/null
# *** ATUALIZADO: Usando wrapper script ***
CMD sh -c "/usr/sbin/dhcpd -cf /etc/dhcp/dhcpd.conf -pf /var/run/dhcpd.pid -4 eth0 & tail -f /dev/null"