#cria usuario com base em um arquivo
ldapadd -x -H ldap://10.10.10.10/ -D "cn=Manager,dc=example,dc=org" -W -f newuser.ldif





#altera a senha
# -W pede a senha do administrador
# -S DN do usuario que terá senha alterada
ldappasswd -x -H ldap://10.10.10.10 -D "cn=Manager,dc=example,dc=org" -W -S "uid=user,ou=People,dc=example,dc=org"
