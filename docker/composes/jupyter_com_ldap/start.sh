#!/bin/bash

A=$(tput sgr0)
export TERM=xterm

if [ ! -e /etc/ldap-bootstrapped ]; then
  echo "configuring lapd-client for first run"

  if [[ $BASE_DN != "" || $URI != "" || $ROOT_ADDCOUNT != "" || $ROOT_PASSWORD != "" ]]; then
    echo ""
    [ -z "$BASE_DN" ] || echo -e '\E[32m'"BASE_DN (Base Distinguished name) value is : $BASE_DN $A"
    [ -z "$URI" ] || echo -e '\E[32m'"URI (Uniform Resource Identifier) value is : $URI $A"
    [ -z "$ROOT_ADDCOUNT" ] || echo -e '\E[32m'"ROOT_ADDCOUNT (LDAP account for root) value is : $ROOT_ADDCOUNT $A"
    [ -z "$ROOT_PASSWORD" ] || echo -e '\E[32m'"ROOT_PASSWORD (LDAP root account password) value is : $ROOT_PASSWORD $A"
    echo ""

    cat <<EOF > /etc/nslcd.conf
    # /etc/nslcd.conf
    uid nslcd
    gid nslcd

    uri $URI
    base $BASE_DN
    ldap_version 3
    rootpwmoddn $ROOT_ADDCOUNT
    tls_cacertfile /etc/ssl/certs/ca-certificates.crt
    EOF

    echo $ROOT_PASSWORD > /etc/ldap.secret

    cp /etc/nsswitch.conf /etc/nsswitch.conf-org
    cat <<EOF > /etc/nsswitch.conf
    # /etc/nsswitch.conf
    #
    # Example configuration of GNU Name Service Switch functionality.
    # If you have the "glibc-doc-reference" and info packages installed, try:
    # 'info libc "Name Service Switch"' for information about this file.
    
    passwd:         ldap compat
    group:          ldap compat
    shadow:         ldap compat
    
    hosts:          files dns
    networks:       files
    
    protocols:      db files
    services:       db files
    ethers:         db files
    rpc:            db files
    
    netgroup:       nis
    EOF

    ## This will create a home directory on the client machine when an LDAP user logs in who does not have a home directory.
    echo "session required    pam_mkhomedir.so skel=/etc/skel umask=0022" >> /etc/pam.d/common-session
    sed -i "s|use_authtok||g" /etc/pam.d/common-password
  else
    ## interactive configuration for ldap-client
    echo -e '\E[32m'"Run 'lets-ldap' for manual configuration of ldap client $A"
  fi
  echo "do not remove this file" >> /etc/ldap-bootstrapped
fi

/etc/init.d/nslcd restart
/etc/init.d/nscd restart
jupyterhub --ip 0.0.0.0 --port 9191
