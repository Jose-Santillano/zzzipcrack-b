#!/bin/bash

# Script para realizar un ataque de diccionario a un archivo ZIP
# Created by: harveydev (github.com/Jose-Santillano)
# Usage: bash main.sh archive.zip dictionary.txt

# Colores para la terminal (código de colores ANSI)
BLUE='\033[0;34m'  # Azul
GREEN='\033[0;32m'  # Verde
RED='\033[0;31m'  # Rojo
RESET='\033[0m'  # Reset

# Mensaje de bienvenida
echo -e "

███████ ███████ ███████ ██ ██████   ██████ ██████   █████   ██████ ██   ██ 
   ███     ███     ███  ██ ██   ██ ██      ██   ██ ██   ██ ██      ██  ██  
  ███     ███     ███   ██ ██████  ██      ██████  ███████ ██      █████   
 ███     ███     ███    ██ ██      ██      ██   ██ ██   ██ ██      ██  ██  
███████ ███████ ███████ ██ ██       ██████ ██   ██ ██   ██  ██████ ██   ██ 
                                                                           
                                                                           

${BLUE}[+]${RESET} - ${GREEN} Created by: ${RESET} ${RED}harveydev${RESET}

"

sleep 3 # Espera 4 segundos

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 archive.zip dictionary.txt"
    exit 1
fi

# Variables
ZIP_FILE=$1
DICTIONARY=$2

# Comprobamos si el archivo ZIP existe
if [ ! -f $ZIP_FILE ]; then
    echo -e "${RED}[-]${RESET} - ${RED}The file $ZIP_FILE does not exist.${RESET}"
    exit 1
fi

# Comprobamos si el archivo DICTIONARY existe
if [ ! -f $DICTIONARY ]; then
    echo -e "${RED}[-]${RESET} - ${RED}The file $DICTIONARY does not exist.${RESET}"
    exit 1
fi

# Mostramos el archivo ZIP y el diccionario
echo -e "${BLUE}[+]${RESET} - ${GREEN}ZIP File:${RESET} ${RED}$ZIP_FILE${RESET}"

echo -e "${BLUE}[+]${RESET} - ${GREEN}Dictionary:${RESET} ${RED}$DICTIONARY${RESET}"

# Ataque de diccionario
echo -e "${BLUE}[+]${RESET} - ${GREEN}Starting dictionary attack...${RESET}\n"

COUNTER=0
while read -r PASSWORD || [[ -n "$PASSWORD" ]]; do

    # Incrementamos el contador
    COUNTER=$((COUNTER + 1))
    
    # Mostramos el contador en la misma línea y sobrescribimos el anterior
    echo -ne "${BLUE}[+]${RESET} - ${GREEN}Passwords tried counter... ${RED}($COUNTER)\r"
    
    # Intentamos descomprimir el archivo con la contraseña actual
    unzip -t -P "$PASSWORD" "$ZIP_FILE" &> /dev/null
    if [ $? -eq 0 ]; then
        echo -e "\n${BLUE}[+]${RESET} - ${GREEN}Password found:${RESET} ${RED}$PASSWORD${RESET}"
        exit 0
    fi
done < "$DICTIONARY"


echo -e "${RED}[-]${RESET} - ${RED}Password not found.${RESET}"
exit 1