#!/bin/bash

# Script para realizar un ataque de diccionario a un archivo ZIP
# Created by: harveydev (github.com/Jose-Santillano)
# Usage: bash main.sh archive.zip dictionary.txt

# Configura el soporte de color
export TERM=xterm-256color

# Colores para la terminal (código de colores ANSI)
BLUE='\033[0;34m'  # Azul
GREEN='\033[0;32m'  # Verde
RED='\033[0;31m'  # Rojo
RESET='\033[0m'  # Reset

# Version
VERSION="1.0.1"

# Detectar si se está ejecutando en Termux
if [ -n "$TERMUX_VERSION" ]; then
    # Banner específico para Termux
    echo -e "
    ${RESET}< |█ █ █ ZZZIPCRACK █ █ █| >\n
    ${BLUE}v${VERSION} (Termux version)\n
    ${GREEN}[+]${RESET} - ${RED}Creado por: harveydev${RESET}
    "
else
    # Banner para otros entornos
    echo -e "
    ███████ ███████ ███████ ██ ██████   ██████ ██████   █████   ██████ ██   ██ 
       ███     ███     ███  ██ ██   ██ ██      ██   ██ ██   ██ ██      ██  ██  
      ███     ███     ███   ██ ██████  ██      ██████  ███████ ██      █████   
     ███     ███     ███    ██ ██      ██      ██   ██ ██   ██ ██      ██  ██  
    ███████ ███████ ███████ ██ ██       ██████ ██   ██ ██   ██  ██████ ██   ██ 

    ${BLUE}v${VERSION}\n${RESET}                                                            
    ${BLUE}[+]${RESET} - ${GREEN}Creado por:${RESET} ${RED}harveydev${RESET}
    "
fi

sleep 3 # Espera 3 segundos

if [ "$#" -ne 2 ]; then
    echo "Uso: $0 archive.zip dictionary.txt"
    exit 1
fi

# Variables
ZIP_FILE=$1
DICTIONARY=$2

# Comprobamos si el archivo ZIP existe
if [ ! -f "$ZIP_FILE" ]; then
    echo -e "${RED}[-]${RESET} - ${RED}El archivo $ZIP_FILE no existe.${RESET}"
    exit 1
fi

# Comprobamos si el archivo DICTIONARY existe
if [ ! -f "$DICTIONARY" ]; then
    echo -e "${RED}[-]${RESET} - ${RED}El archivo $DICTIONARY no existe.${RESET}"
    exit 1
fi

# Mostramos el archivo ZIP y el diccionario
echo -e "${BLUE}[+]${RESET} - ${GREEN}Archivo ZIP:${RESET} ${RED}$ZIP_FILE${RESET}"
echo -e "${BLUE}[+]${RESET} - ${GREEN}Diccionario:${RESET} ${RED}$DICTIONARY${RESET}"

# Ataque de diccionario
echo -e "${BLUE}[+]${RESET} - ${GREEN}Iniciando ataque de diccionario...${RESET}\n"

COUNTER=0
while read -r PASSWORD || [[ -n "$PASSWORD" ]]; do
    COUNTER=$((COUNTER + 1))
    echo -ne "${BLUE}[+]${RESET} - ${GREEN}Contraseñas probadas... ${RED}($COUNTER)\r"
    unzip -t -P "$PASSWORD" "$ZIP_FILE" &> /dev/null
    if [ $? -eq 0 ]; then
        echo -e "\n${BLUE}[+]${RESET} - ${GREEN}Contraseña encontrada:${RESET} ${RED}$PASSWORD${RESET}"
        exit 0
    fi
done < "$DICTIONARY"

echo -e "${RED}[-]${RESET} - ${RED}Contraseña no encontrada.${RESET}"
exit 1
