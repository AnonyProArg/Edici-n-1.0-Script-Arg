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

alias_name="black"
alias_command="wget -O /etc/FF.sh https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/FF.sh && chmod +x /etc/FF.sh && bash /etc/FF.sh"
clear
# Agregar el alias al archivo ~/.bashrc si no existe
if ! grep -Fxq "source ~/.myalias" ~/.bashrc; then
    echo "source ~/.myalias" >> ~/.bashrc
fi
clear
# Crear el archivo ~/.myalias si no existe
if [ ! -f ~/.myalias ]; then
    echo "alias $alias_name='$alias_command'" > ~/.myalias
else
    # Reemplazar el alias existente si ya existe
    awk -v alias_name="$alias_name" -v alias_command="$alias_command" '!/^alias '$alias_name'=/{print} END{print "alias " alias_name "=\x27" alias_command "\x27"}' ~/.myalias > ~/.myalias.tmp
    mv ~/.myalias.tmp ~/.myalias
fi
clear
# Cargar la línea en la sesión actual
source ~/.myalias


# Limpiar pantalla
clear
echo "Comando de ejecución: black"

sleep 5

clear
bash /etc/FF.sh
