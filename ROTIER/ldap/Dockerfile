FROM osixia/openldap:1.5.0

COPY base.ldif /container/service/slapd/assets/config/bootstrap/ldif/50-bootstrap.ldif
COPY entrypoint.sh /conatiner-entrypoint.sh
RUN chmod +x /container-entrypoint.sh

ENTRYPOINT ["/container-entrypoint.sh"]
