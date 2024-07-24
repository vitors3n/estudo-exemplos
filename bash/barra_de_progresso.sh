#!/bin/bash

# Função para criar a barra de progresso
progress_bar() {
    local percentage=$1
    local total_chars=10
    local filled_chars=$((percentage * total_chars / 100))
    local empty_chars=$((total_chars - filled_chars))

    local filled_part=$(printf "\e[41m%${filled_chars}s\e[0m" | tr ' ' '|')

    local empty_part=$(printf "\e[42m%${empty_chars}s\e[0m" | tr ' ' '|')
    echo -e "[${filled_part}${empty_part}]"
}

usage_percentage=92
progress_bar $usage_percentage
