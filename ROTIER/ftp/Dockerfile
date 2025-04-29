FROM debian:latest

RUN apt-get update && \
    apt-get install -y vsftpd --no-install-recommends && \
    mkdir -p /var/run/vsftpd/empty && \
    rm -rf /var/lib/apt/lists/*

COPY vsftpd.conf /etc/vsftpd.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
