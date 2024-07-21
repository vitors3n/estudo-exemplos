# Exemplo de Rstudio com suporte ao PAM e LDAP

Para construir imagem:

``` docker build -t rstudio-ldap . ```


Para rodar container:
```

docker run -d -p 8787:8787 \
  -e BASE="dc=example,dc=com" \
  -e URI="ldap://ldap.example.com" \
  -e BIND_DN="cn=admin,dc=example,dc=com" \
  -e BIND_PW="password" \
  -e TLS_CERT="/path/to/cert.pem" \
  --name rstudio-ldap rstudio-ldap

```

Caso queira limitar o uso para algum grupo especifico adicione essa linha no arquivo /etc/pam.d/common-auth

```auth required pam_succeed_if.so user ingroup <groupname>```
