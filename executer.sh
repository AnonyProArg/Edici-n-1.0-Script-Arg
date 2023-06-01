#!/bin/bash
rm /etc/PsiphonFF.sh

# Función para mostrar el título

show_title() {

    clear

    echo "*****************************"

    echo "  Instalador Psiphon  "

    echo "*****************************"

    echo

}

# Función para descargar el archivo PsiphonFF.sh

download_psiphon_script() {


    wget -O /etc/PsiphonFF.sh https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/PsiphonFF.sh

    chmod +x /etc/PsiphonFF.sh
    
    clear

    echo "El archivo PsiphonFF.sh se ha descargado correctamente en /etc/PsiphonFF.sh y se le han dado permisos de ejecución."

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

# Ejecutar la función principal

execute
