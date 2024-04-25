#Exemplos de search e explicações

#Busca usuário especifico
ldapsearch -x -H ldap://1.1.1.1 -b "dc=server,dc=org" "(uid=usuario)"
# -x = simple auth, -H = URI do LDAP, -b base DN do LDAP

#Busca multiplos usuários com um nome epecifico
ldapsearch -x -H ldap://1.1.1.1 -b "dc=server,dc=org" "(uid=*usuario*)" # começando com usuário = usuario*, terminando = *usuario

#Busca ultimo uidNumber
ldapsearch -x -H ldap://1.1.1.1 -b "dc=server,dc=org" "(uidNumber=*)" uidNumber | grep uidNumber | sort -n | tail -n 1
#Ex de resultado:
#uidNumber: 200

#Para remover 'uidNumber: ' do resultado é possível com o comando: sed -e
ldapsearch -x -H ldap://1.1.1.1 -b "dc=server,dc=org" "(uidNumber=*)" uidNumber | grep uidNumber | sort -n | tail -n 1 | sed -e "s/^uidNumber: //"


# Transforma dados da busca em apenas uma linha
# uid=vitor uidNumber: 1001 mail: vitor@email.com
ldapsearch -xLLL -H ldap://1.1.1.1 -b "ou=People,dc=server,dc=org" "(mail=*)" mail uidNumber | \
        sed 's/dn: //'  | \
        sed 's/,ou=People,dc=server,dc=org//' | \
        sed 's/\n//' | \
        sed ':a;N;$!ba;s/\n\n/___double_newline___/g;s/\n/ /g;s/___double_newline___/\n/g'
