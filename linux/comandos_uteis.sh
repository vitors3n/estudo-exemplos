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

# Adicionando conteudo a arquivos
echo "Conteudo que será adicionado ao final da linha" >> text.txt

echo "Conteúdo que substituirá todo conteúdo dentro do arquivo" > text.txt

#direcionando resultados de comandos para o além
# 2>&1 -> junta 2 erro com 1 output
mkdir > /dev/null 2>&1 #erro e resultado do comando será enviado para o além

#0: standard input
#1: standard output
#2: standard error
