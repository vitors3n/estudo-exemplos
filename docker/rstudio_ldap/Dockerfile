FROM rocker/rstudio:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    nscd \
    nslcd \
    ldap-utils \
    && apt-get clean

COPY iniciar_rstudio.sh /root/iniciar_rstudio.sh
RUN chmod +x /root/iniciar_rstudio.sh

# ---- Instale os pacotes aqui ----

# --------------------------------

EXPOSE 8787

ENTRYPOINT ["/root/iniciar_rstudio.sh"]
