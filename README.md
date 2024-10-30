# Ataque de Diccionario a un Archivo ZIP (Programado en Bash)

Este script en Bash realiza un ataque de diccionario a un archivo ZIP protegido, utilizando un diccionario de contraseñas. Intentará cada contraseña del diccionario hasta encontrar la correcta o agotar todas las opciones disponibles.

**Autor:** [harveydev](https://github.com/Jose-Santillano)

## Requisitos

-  **Archivo ZIP** protegido con contraseña

-  **Diccionario de contraseñas** en formato de texto plano (.txt)

## Instalación (Linux, Windows & Termux)

### Clonamos el repositorio en nuestro equipo local.
```cmd

git clone https://github.com/Jose-Santillano/zzzipcrack-b

```

### Accedemos a la carpeta

```cmd

cd zzzipcrack-b

```

### Descargamos nuestro diccionario (en este caso descargamos rockyou.txt)

Este comando es recomendado, en tu caso puedes descargarlo como tu lo quieras.
```cmd

curl -L -o rockyou.txt https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt


```

Y listo, solo sería tener nuestro .zip en nuestra carpeta principal y todo funcionara correctamente.


## Uso

Para ejecutar el script, abre la terminal y utiliza el siguiente comando, reemplazando `<archivo.zip>` y `<diccionario.txt>` con el nombre de tu archivo ZIP y el archivo de diccionario, respectivamente:

  

```bash

bash  main.sh <archivo.zip> <diccionario.txt>

```

## Diccionario de contraseñas

Puedes utilizar el por defecto **rockyou.txt** o utilizar cualquier otro archivo de tu preferencia. 

 - Descargar [rockyou](https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt)

## Imágenes

![alt text](/imgs/image.png)

![alt text](/imgs/image-1.png)

![alt text](/imgs/image-2.png)