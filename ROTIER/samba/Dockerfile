# Arquivo: ./samba/Dockerfile

# Use uma imagem base Ubuntu (ou Alpine se preferir e adaptar os comandos)
FROM ubuntu:latest

# Defina variáveis de ambiente para evitar prompts interativos durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Instale o pacote samba e utilitários essenciais
RUN apt-get update && apt-get install -y --no-install-recommends samba samba-common-bin smbclient iputils-ping && \
    rm -rf /var/lib/apt/lists/* 
# Crie um diretório para os arquivos de configuração SAMBA (smb.conf)
RUN mkdir /etc/samba/conf.d

# Crie um diretório para os compartilhamentos de arquivos
RUN mkdir /srv/samba_share

# Copie o arquivo de configuração smb.conf customizado
# COPIARÁ DE ./samba/smb.conf NO SEU HOST PARA DENTRO DO CONTAINER
COPY smb.conf /etc/samba/conf.d/smb.conf

# Exponha as portas padrão do SAMBA (NetBIOS/SMB)
EXPOSE 137/udp
EXPOSE 138/udp
EXPOSE 139/tcp
EXPOSE 445/tcp

# Comando padrão para iniciar o serviço SAMBA e manter o container rodando
# O 'service samba start' inicia o daemon em segundo plano
# 'tail -f /dev/null' mantém o container rodando
# Copie o entrypoint.sh para dentro do container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use o entrypoint
ENTRYPOINT ["/entrypoint.sh"]
