
### Crie um arquivo antes_de_suspensao.service em /etc/systemd/system/

```ini

[Unit]
Description=Executa antes de entrar em modo de suspensão

[Service]
Type=oneshot
ExecStart=/script.sh

[Install]
WantedBy=sleep.target

```

### Conteudo do script.sh

```bash
#!/bin/bash
echo "ira executar antes de uma suspensão de sistema"
```

### Recarregue o systemd e ative o serviço criado

```sh

sudo systemctl daemon-reload

sudo systemctl enable limpar_cache.service

```
