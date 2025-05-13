FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y apache2 iproute2 --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* 

RUN rm /var/www/html/index.html

# Expoe a porta 80 (HTTP)
EXPOSE 80

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
