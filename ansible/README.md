### Pasta para estudos com ansible.

### Links

#### Update de todos os pacotes ou apenas upgrade
https://www.cyberciti.biz/faq/ansible-apt-update-all-packages-on-ubuntu-debian-linux/

#### Instalação no Alma
https://www.liquidweb.com/kb/install-ansible-almalinux/


---

### Peparando um host windows para ansible
Instale e configure WinRM com:

```

winrm quickconfig

```

Instale o pywinrm no control node
```

pip install pywinrm

```


Crie o invetário de máquinas windows 

```

[windows]
my_windows_host ansible_host=192.168.1.100 ansible_user=myuser ansible_password=mypassword ansible_connection=winrm


```

Teste a conexão

```

ansible windows -i hosts -m win_ping

```

---
