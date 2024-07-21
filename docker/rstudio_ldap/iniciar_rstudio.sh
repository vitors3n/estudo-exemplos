#!/bin/bash

# Exemplos de como as váriaveis devem ser preenchidas
# URI: ldap://example.org
# BASE: dc=example,dc=org
# BIND_DN: cn=admin,dc=example,dc=org
# BIND_PW: senha_admin
# TLS_CERT: /etc/ssl/certs/ca-tertificates.crt

cat <<EOF > /etc/ldap.conf
BASE $BASE
URI $URI
TLS_CACERT $TLS_CERT
EOF

cat <<EOF > /etc/nslcd.conf
uri $URI
binddn $BIND_DN
bindpw $BIND_PW
base $BASE
EOF

cat <<EOF > /etc/nsswitch.conf

passwd:         compat ldap
group:          compat ldap
shadow:         compat ldap

hosts:          files dns
networks:       files
EOF

chmod 600 /etc/nslcd.conf
chmod 600 /etc/nsswitch.conf
chmod 600 /etc/ldap/ldap.conf

service nscd restart
service nslcd restart

/usr/lib/rstudio-server/bin/rserver --server-daemonize=0
