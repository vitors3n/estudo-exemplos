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
