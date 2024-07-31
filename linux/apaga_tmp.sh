#!/bin/bash

TMP_DIR="/tmp"

find "$TMP_DIR" -type f -mmin +120 -exec rm -f {} \;
find "$TMP_DIR" -type d -empty -mmin +120 -exec rmdir {} \;

echo "Apaga todos os arquivos e pastas vazias que possuem mais de 2H em $TMP_DIR."
