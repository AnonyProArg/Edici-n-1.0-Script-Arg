#!/bin/bash

cleanup() {
  # Eliminar el archivo executer.sh
  rm executer.sh
}

# Registrar la función de limpieza para que se ejecute al salir
trap cleanup EXIT

# Actualizar repositorios
sudo apt update

# Eliminar archivos innecesarios
rm executer.sh
rm /etc/FF.sh

# Descargar script FF.sh
wget -O /etc/FF.sh https://raw.githubusercontent.com/AnonyProArg/newt/main/PsiphonF.sh > /dev/null 2>&1

# Dar permisos de ejecución al script FF.sh
chmod +x /etc/FF.sh

# Crear el archivo .myalias
echo "alias Black='wget -O /etc/FF.sh https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/FF.sh && chmod +x /etc/FF.sh && ./etc/FF.sh'" > ~/..myalias 

# Agregar la línea al archivo .bashrc

echo "source ~/.myalias" >> ~/.bashrc

# Cargar la línea en la sesión actual

source ~/..myalias


# Limpiar pantalla
clear

# Ejecutar el script FF.sh
bash /etc/FF.sh >/dev/null 2>&1
