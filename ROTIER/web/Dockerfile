# Use uma imagem base Ubuntu
FROM ubuntu:latest

# Atualize a lista de pacotes e instale Apache2 E iproute2
RUN apt-get update && \
    apt-get install -y apache2 iproute2 --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Remova o arquivo index.html padrão do Apache
RUN rm /var/www/html/index.html

# Exponha a porta 80 (HTTP)
EXPOSE 80

# Comando para manter o Apache rodando em primeiro plano
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]