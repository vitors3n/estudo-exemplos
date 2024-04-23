#Lista containers com filtro exited ou dead
docker container ls -f 'status=exited' -f 'status=dead' | awk '{print $4 " " $5}' | grep months

#Remove imagens com status dangling
docker rmi $(docker images -f dangling=true -q)

#Mostra quanto de espaço em disco o docker está utilizando, images, containers etc.
docker system df

# Update realiza o update de memoria em todos os containers
docker update --memory 29gb --memory-swap 29gb $(docker ps | awk '{print $1}' | tail -n +2)

#Joga resultado do update para o além
docker update --memory 29gb --memory-swap 29gb $(docker ps | awk '{print $1}' | tail -n +2) > /dev/null 2>&1

# Imprime lista de container IDs em execução excluindo primeira linha que possui o nome CONTAINER ID
docker ps | awk '{print $1}' | tail -n +2
