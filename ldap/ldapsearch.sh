#Exemplos de search e explicações

#Busca usuário especifico
ldapsearch -x -H ldap://1.1.1.1 -b "dc=server,dc=org" "(uid=usuario)"
# -x = simple auth, -H = URI do LDAP, -b base DN do LDAP

#Busca multiplos usuários com um nome epecifico
ldapsearch -x -H ldap://1.1.1.1 -b "dc=server,dc=org" "(uid=*usuario*)" # começando com usuário = usuario*, terminando = *usuario
