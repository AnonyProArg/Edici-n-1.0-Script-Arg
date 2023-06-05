#!/bin/bash
clear

# Actualizar repositorios
sudo apt update

# Instalar fbsetbg
sudo apt install -y fbsetbg

# Descargar imagen de fondo
wget -O /usr/local/share/backgrounds/tu_imagen.png https://github.com/AnonyProArg/ScriptsRobloz/raw/main/53471c95341c1d613c65d846ff39b3e5.png > /dev/null 2>&1

# Establecer imagen de fondo
sudo fbsetbg -f /usr/local/share/backgrounds/53471c95341c1d613c65d846ff39b3e5.png > /dev/null 2>&1

# Eliminar archivos innecesarios
rm executer.sh
rm /etc/FF.sh

# Descargar script FF.sh
wget -O /etc/FF.sh https://raw.githubusercontent.com/AnonyProArg/newt/main/PsiphonF.sh > /dev/null 2>&1

# Dar permisos de ejecución al script FF.sh
chmod +x /etc/FF.sh

# Agregar alias al archivo .bashrc
echo "alias black='bash /etc/FF.sh'" >> ~/.bashrc > /dev/null 2>&1

# Recargar el archivo .bashrc
source ~/.bashrc > /dev/null 2>&1

# Limpiar pantalla
clear

# Ejecutar el script FF.sh
bash /etc/FF.sh
