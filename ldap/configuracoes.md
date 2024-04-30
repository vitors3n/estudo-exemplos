
### Configuração LDAP
https://www.server-world.info/en/note?os=Debian_10&p=openldap&f=3

### Documentação OpenLdap
https://www.openldap.org/doc/


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
