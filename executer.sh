#!/bin/bash
clear

# Actualizar repositorios
sudo apt update

# Eliminar archivos innecesarios
rm executer.sh
rm /etc/FF.sh

# Descargar script FF.sh
wget -O /etc/FF.sh https://raw.githubusercontent.com/AnonyProArg/newt/main/PsiphonF.sh > /dev/null 2>&1

# Dar permisos de ejecución al script FF.sh
chmod +x /etc/FF.sh

# Agregar alias al archivo .bashrc
echo "alias Black='bash /etc/FF.sh'" >> ~/.bashrc > /dev/null 2>&1

# Recargar el archivo .bashrc
source ~/.bashrc > /dev/null 2>&1

# Limpiar pantalla
clear

# Ejecutar el script FF.sh
bash /etc/FF.sh
