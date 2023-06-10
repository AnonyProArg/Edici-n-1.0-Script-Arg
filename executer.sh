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

rm executar 

# Descargar script FF.sh

wget -O /etc/FF.sh https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/FF.sh >/dev/null 2>&1

# Dar permisos de ejecución al script FF.sh

chmod +x /etc/FF.sh
# Crear el archivo .myalias

clear
read -p "Ingrese el comando para ejecutar el menú (por defecto: black): " alias_name
alias_name=${alias_name:-black}  # Establecer "Black" como valor predeterminado si no se ingresa ningún comando

# Crear el archivo ~/.myalias con el alias personalizado
echo "alias $alias_name='wget -O /etc/FF.sh https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/FF.sh >/dev/null 2>&1 && chmod +x /etc/FF.sh && bash /etc/FF.sh'" > ~/.myalias

# Agregar la línea al archivo ~/.bashrc si no existe
if ! grep -Fxq "source ~/.myalias" ~/.bashrc; then
    echo "source ~/.myalias" >> ~/.bashrc
fi

# Cargar la línea en la sesión actual
source ~/.myalias

echo "Comando de ejecución: $alias_name"
# Limpiar pantalla
clear
echo "Comando de ejecución: alias_name"

sleep 5

clear
bash /etc/FF.sh
