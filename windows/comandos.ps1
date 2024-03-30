
# Como usar um disco como máquina virtual? como usar um sistema operacional em um disco como máquina virtual

# Use para listar os discos e pegue o número

Get-PhysicalDisk

# Coloque o número do disco que você deseja usar como VM, por exemplo: .PyshicalDrive2

C:\"Program Files"\Oracle\Virtualbox\VBoxManage internalcommands createrawvmdk -filename "E:\Arquivos\VMs\oldwin.vmdk" -rawdisk .PhysicalDrive<Número aqui>

