FROM osixia/openldap:1.5.0

COPY base.ldif /container/service/slapd/assets/config/bootstrap/ldif/50-bootstrap.ldif
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
