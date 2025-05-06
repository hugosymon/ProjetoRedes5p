#!/bin/bash

# Verifica se já existe a base de dados LDAP
if [ ! -f /var/lib/ldap/data.mdb ]; then
  echo "Inicializando banco LDAP com base.ldif..."
  /container/tool/run --copy-service
fi

# Executa normalmente o serviço do OpenLDAP
exec /container/tool/run
