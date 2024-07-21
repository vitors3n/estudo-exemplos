FROM rocker/rstudio:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    nscd \
    nslcd \
    ldap-utils \
    && apt-get clean

COPY inicia_rstudio.sh /root/inicia_rstudio.sh

EXPOSE 8787

ENTRYPOINT ["/root/inicia_rstudio.sh"]
