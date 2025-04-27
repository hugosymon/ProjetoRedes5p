# Use uma imagem base Ubuntu
FROM ubuntu:latest

# Atualize a lista de pacotes e instale o vsftpd
RUN apt-get update && \
    apt-get install -y vsftpd --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Crie o diretório para o arquivo de configuração vsftpd
RUN mkdir -p /etc/vsftpd

# Crie o diretório para usuários locais (chroot)
RUN mkdir -p /home/vsftpd_users

# Copie o script de entrada (entrypoint) se necessário para config dinâmica, ou apenas use vsftpd no CMD
# Aqui vamos usar CMD para simplicidade e montar a config

# Exponha a porta de controle padrão do FTP
EXPOSE 21
# Exponha uma faixa de portas para modo passivo (exemplo)
# EXPOSE 20000-21000 # Defina esta faixa no vsftpd.conf também

# Comando para manter o vsftpd rodando em primeiro plano
# O flag -p especifica o PID file
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]