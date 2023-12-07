# Instalar IR Kernel para Jupyter
# Como adicionar RKernel no jupyter lab instalado via PIP no ubunto
# R 'install.packages("devtools")' # < ignore ubunto 


# Provavelmente nao será necessário instalar o r-base.
# Verificar versão do R antes.
#sudo apt-get install r-base && \

sudo apt install r-cran-devtools && \
R -e "devtools::install_github('IRkernel/IRkernel')" && \
jupyter kernelspec install /usr/local/lib/R/site-library/IRkernel/kernelspec --name 'R' --user

#jupyter kernelspec install /usr/lib/R/x86_64-pc-linux-gnu-library/4.1/IRkernel/kernelspec --name 'R' --user

#Pasta deve ser executavel para permitir acesso pelo grupo
sudo chown -R vitor:fish cyber/
sudo chmod g+rwx cyber/

