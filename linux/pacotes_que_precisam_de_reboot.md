### Lista de pacotes que precisam de reboot depois de um upgrade.

Para saber quais pacotes estão pendentes de reboot use:
```

cat /var/run/reboot-required.pkgs

```
* se o arquivo não existe, o reboot não é necessário

- linux-image*
- dbus
- systemd
- 
