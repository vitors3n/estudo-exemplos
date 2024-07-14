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

# Direcionando resultados de comandos para o além
# 2>&1 -> junta 2 erro com 1 output
mkdir > /dev/null 2>&1 #erro e resultado do comando será enviado para o além

#0: standard input
#1: standard output
#2: standard error

# Comandos de leitura
tail -f logs # follow logs
tail logs #imprime ultimas linhas sem follow
head # ->

# Como mudar hostname no linux?
# Basta editar o arquivo hostname localizado em /etc/hostname

nano /etc/hostname
sudo reboot #para aplicar a mudança

# -a recursivo, -v verbose
# --progress mostra progresso da transferencia
rsync -av /path/to/source /path/to/destination

# verifica integridade com --checksum
rsync --checksum -av /path/to/source /path/to/destination

# checar integridade 
md5sum /path/to/source/file1 /path/to/source/file2

#copia resultado parar aquivo
md5sum /path/to/source/file1 > checksum.md5

# Exemplo de BASH_REMATCH[0]
string="Hello, world!"

pattern="Hello, (.*)!"

if [[ $string =~ $pattern ]]; then
    echo "Matched: ${BASH_REMATCH[0]}"
    echo "Capture group 1: ${BASH_REMATCH[1]}"
else
    echo "No match"
fi

# Verifica se uma pasta esta diponivel com bash
#!/bin/bash

timeout 5s ls /pasta

if [ $? -eq 124 ]; then
        echo "indisponivel" >&2
        exit 1
fi

# Grava um arquivo em disco para testar velocidade de gravação
dd if=/dev/sda1 of=/tmp/test1.img bs=1G count=1 oflag=dsync
