# É preciso desmontar o disco para aplicar alteração necessária
sudo umount /home

# Adicione a linha necessária no fstab
/dev/sda1  /home  ext4  defaults,usrquota,grpquota  0  0

# Ative a opcao de receber a quota na particao
sudo tune2fs -O quota /dev/sda1
sudo mount -a

# Ativa a quota
quotaon -va

# cria os arquivos de quota
sudo quotacheck -cug /home

sudo repquota /home 
