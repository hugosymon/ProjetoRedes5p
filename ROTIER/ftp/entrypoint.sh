#!/bin/sh
#
# entrypoint.sh – inicia o vsftpd em primeiro plano
#

set -eu

exec /usr/sbin/vsftpd /etc/vsftpd.conf

