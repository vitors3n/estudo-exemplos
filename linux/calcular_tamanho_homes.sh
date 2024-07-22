#!/bin/bash

PASTA_HOME="/home"

# Pasta uso total deve ter a pasta logs e uso_total

PASTA_USO_TOTAL="/uso-home"
ARQUIVO_SAIDA="$PASTA_USO_TOTAL/logs/usototal.log"

> "$ARQUIVO_SAIDA"

for PASTA_USUARIO in "$PASTA_HOME"/*; do
    if [ -d "$PASTA_USUARIO" ]; then
        USUARIO=$(basename "$PASTA_USUARIO")
        TAMANHO_TOTAL=$(du -sh "$PASTA_USUARIO" | awk '{print $1}')
        ARQUIVO_RESULTADO="$PASTA_USO_TOTAL/uso_total/$USUARIO.usototal"
        echo "$TAMANHO_TOTAL" > "$ARQUIVO_RESULTADO"
        echo "$(date) - Tamanho da pasta de $USUARIO é de $TAMANHO_TOTAL" >> "$ARQUIVO_SAIDA"
    fi
done
