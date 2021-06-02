#!/bin/bash

echo -e "ESCRIBE TU NOMBRE PARA EL INICIO: "
read nombre 
echo "ENCANTADO DE CONOCERTE, $nombre"
perl -pi -e "s[A TODOS][$nombre]g" /etc/VPS-ARG/bienvenido.txt
echo  "NOMBRE ACTUALIZADO"
msg -ne "Enter Para Continuar" && read enter
VPS-ARG
