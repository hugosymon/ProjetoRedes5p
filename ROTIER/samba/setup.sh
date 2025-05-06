#!/bin/bash
set -e

mkdir -p /samba/public

# Cria usuário do sistema
useradd -M theuser

# Cria usuário no Samba com senha "senha"
(echo "senha"; echo "senha") | smbpasswd -s -a theuser

# Permissões
chown -R theuser:theuser /samba/public

# Inicia serviços
smbd -F