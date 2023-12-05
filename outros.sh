# Instalar IR Kernel para Jupyter
# Como adicionar RKernel no jupyter lab instalado via PIP
# R 'install.packages("devtools")'
sudo apt-get install r-base # provavelmente nao será necessário.
sudo apt install r-cran-devtools
R -e "devtools::install_github('IRkernel/IRkernel')"
jupyter kernelspec install /home/$USER/R/x86_64-pc-linux-gnu-library/4.1/IRkernel/kernelspec --name 'R' --user

