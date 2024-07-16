### Cores e emojis no terminal do linux.
https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

----
### Como realizar boot no linux apenas pelo terminal/console
https://www.linuxuprising.com/2020/01/how-to-boot-to-console-text-mode-in.html

Use:
```bash
sudo systemctl set-default multi-user.target
```
Para voltar para o modo gráfico:
```bash
sudo systemctl set-default graphical.target
```
----


### Mostrar usuário e hostname no oh-my-zsh
https://github.com/ohmyzsh/ohmyzsh/issues/5686#issuecomment-486348316


### Algumas explicações sobre /etc/skel no Linux
https://www.thegeekdiary.com/understanding-the-etc-skel-directory-in-linux/


### Criação de Symlinks com path relativo
https://www.baeldung.com/linux/absolute-and-relative-symlinks


### Sobre umount e quando apresnetar erro target is busy (resolução com fuser)
https://ioflood.com/blog/umount-linux-command/

### Sourceslist do Debian 11 ~ 12
https://wiki.debian.org/pt_BR/SourcesList


### Por padrão o Rstudio server usa PAM para realizar o login no serviço
https://docs.posit.co/ide/server-pro/1.4.1103-4/authenticating-users.html#pam-authentication


### Previne root pelo bootloader
https://unix.stackexchange.com/questions/17284/how-can-i-prevent-someone-from-gaining-root-access-through-the-bootloader


### Cgroups no Ubuntu
https://gist.github.com/avoidik/1c7c53f02461f716aabebf3372a6199d

### Componentes do Linux
https://dustybugger.com/components-of-linux/

### cgroups limitando memória para todos os usuários
https://pavlokhmel.com/cgroup-v2-limit-memory-and-cpu-usage-for-all-users-on-linux.html

### Melhorando desempenho do NFS
https://www.suse.com/pt-br/support/kb/doc/?id=000021413

Editar arquivo /etc/nfs.conf ou usar

rpc.nfsd 128 para aumentar as threads

ps aux | grep "\[nfsd\]" | wc -l
