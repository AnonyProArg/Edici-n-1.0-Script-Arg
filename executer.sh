#!/bin/bash

# Función para mostrar el título

show_title() {

    clear

    echo "*****************************"

    echo "  Instalador Psiphon  "

    echo "*****************************"

    echo

}

# Función para descargar el archivo PsiphonF.sh

download_psiphon_script() {

    wget -O /etc/PsiphonFF.sh https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/PsiphonFF.sh

    chmod +x /etc/PsiphonFF.sh

    echo "El archivo PsiphonF.sh se ha descargado correctamente en /etc/PsiphonF.sh y se le han dado permisos de ejecución."

}

# Función para agregar el alias al archivo .bashrc

add_alias_to_bashrc() {

    echo "alias black='bash /etc/PsiphonFF.sh'" >> ~/.bashrc

    echo "Se ha agregado el alias 'black' al archivo .bashrc."

}

# Función para recargar el archivo .bashrc

reload_bashrc() {

    source ~/.bashrc

    echo "Se han aplicado los cambios del archivo .bashrc."

}

# Función para ejecutar el alias black

execute_black() {

    black

    echo "Se ha ejecutado el alias 'black'."

}

# Función principal para ejecutar las funciones

execute() {

    show_title

    download_psiphon_script

    add_alias_to_bashrc

    reload_bashrc

    execute_black

    rm executer.sh

    echo "El archivo executer.sh ha sido eliminado."

}

# Dar permisos de ejecución al archivo executer.sh

chmod +x executer.sh

# Ejecutar la función principal

execute

