FROM rocker/rstudio:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    nscd \
    nslcd \
    ldap-utils \
    && apt-get clean

COPY nslcd.conf /etc/nslcd.conf
COPY nsswitch.conf /etc/nsswitch.conf
COPY ldap.conf /etc/ldap/ldap.conf

RUN chmod 600 /etc/nslcd.conf
RUN chmod 600 /etc/nsswitch.conf
RUN chmod 600 /etc/ldap/ldap.conf

EXPOSE 8787

CMD ["sh", "-c","service nscd start && service nslcd start && /usr/lib/rstudio-server/bin/rserver --server-daemonize=0"]
