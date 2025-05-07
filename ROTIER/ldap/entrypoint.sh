#!/bin/bash
set -e

# Start the original entrypoint in background
/docker-entrypoint.sh &

# Wait for LDAP service to be ready
until ldapsearch -x -H ldap://localhost -b dc=example,dc=org >/dev/null 2>&1; do
  echo "Waiting for LDAP to be ready..."
  sleep 2
done

# Import the LDIF
ldapadd -x -D "cn=admin,dc=example,dc=org" -w admin -f /container/service/slapd/assets/config/bootstrap/ldif/50-bootstrap.ldif

wait
