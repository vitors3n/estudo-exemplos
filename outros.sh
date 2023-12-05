# Instalar IR Kernel para Jupyter
# Como adicionar RKernel no jupyter lab instalado via PIP no ubunto
# R 'install.packages("devtools")' # < não usar


# Provavelmente nao será necessário instalar o r-base.
# Verificar versão do R antes.
sudo apt-get install r-base && \
sudo apt install r-cran-devtools && \
R -e "devtools::install_github('IRkernel/IRkernel')" && \
jupyter kernelspec install /home/$USER/R/x86_64-pc-linux-gnu-library/4.1/IRkernel/kernelspec --name 'R' --user  && \
