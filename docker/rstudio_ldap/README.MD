# Exemplo de Rstudio com suporte ao PAM e LDAP

Para construir imagem:

``` docker build -t rstudio-ldap . ```


Para rodar container:

```docker run -d -p 8787:8787 --name rstudio-ldap rstudio-ldap```
