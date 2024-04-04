# 1 origem
# 2 destino
scp -P 22 vitor@1.1.1.1:arquivo.1 vitor@2.2.2.2:arquivo.1
# usar -r para copiar diretorios recursivamente

scp -P 4422 vitor@alemanha:URL .
#copia um arquivo do servidor alemanha para a pasta onde o comando foi rodado

# ---

ssh -p
ssh -i

# ---

usermod -aG group user
# a adds, G groups

chmod 4760 ?
# esp

# u->user, g->group, o->others
chmod ugo+rwx file

