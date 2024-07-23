# Linux
# Primeiro gere um par de senhas ssh na máquina de controle
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

# Use o comado de cópia para a máquina que você está adicionando como host
# Se uma chave ssh especifica não for configurada ele usará uma chave padrão id_rsa.pub
ssh-copy-id -i ~/.ssh/your_specific_key.pub user@hostname




# Windows
# Com PowerShell em modo ADM
winrm quickconfig
winrm set winrm/config/service/auth @{Basic="true"}
winrm set winrm/config/service @{AllowUnencrypted="true"}
winrm set winrm/config/winrs @{MaxMemoryPerShellMB="1024"}
winrm set winrm/config @{MaxTimeoutms="1800000"}

New-NetFirewallRule -Name "WinRM-HTTP" -DisplayName "WinRM over HTTP" -Enabled True -Direction Inbound -Protocol TCP -LocalPort 5985
New-NetFirewallRule -Name "WinRM-HTTPS" -DisplayName "WinRM over HTTPS" -Enabled True -Direction Inbound -Protocol TCP -LocalPort 5986

winrm create winrm/config/listener?Address=*+Transport=HTTP

# Exemplo de host ini com máquinas windows

[windows]
windows_host_1 ansible_host=192.168.1.100
windows_host_2 ansible_host=192.168.1.101
windows_host_3 ansible_host=192.168.1.102

[windows:vars]
ansible_user=Administrator
ansible_password=YourPassword
ansible_connection=winrm
ansible_winrm_server_cert_validation=ignore
ansible_winrm_transport=basic
