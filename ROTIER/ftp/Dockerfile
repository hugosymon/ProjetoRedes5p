FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y vsftpd ftp openssl && \
    useradd -m ftpuser && \
    echo "ftpuser:1234" | chpasswd && \
    mkdir -p /home/ftpuser/ftp/files && \
    chown -R ftpuser:ftpuser /home/ftpuser/ftp

COPY vsftpd.conf /etc/vsftpd.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh \
    && mkdir -p /var/run/vsftpd/empty \
    && chown root:root /var/run/vsftpd/empty \
    && chmod 755 /var/run/vsftpd/empty

EXPOSE 20 21 10090-10100

CMD ["/entrypoint.sh"]