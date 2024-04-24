

Bloqueando leitura de atributos por outros usuários.

arquivo slapd.conf

```ldif

access to attribute=mail
  by dn.exact="cn=admin,dc=example,dc=com" read

access to attribute=mail
  by * none

```

Privando multiplos atributos.
```ldif

access to attribute={mail|mobile}
  by dn.exact="cn=admin,dc=example,dc=com" read

access to attribute={mail|mobile}
  by * none

```
