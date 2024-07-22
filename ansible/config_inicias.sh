# Primeiro gere um par de senhas ssh na máquina de controle
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

# Use o comado de cópia para a máquina que você está adicionando como host
# Se uma chave ssh especifica não for configurada ele usará uma chave padrão id_rsa.pub
ssh-copy-id -i ~/.ssh/your_specific_key.pub user@hostname

# TODO
# Saber como reparar os hosts windows com winRM

# Testar scripts simples de instalação e update de máquinas
