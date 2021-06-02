#!/bin/bash
clear
echo  "SOLO UN CAMBIO POR ACTUALIZACIÓN"
echo -e "ESCRIBE TU NOMBRE PARA EL INICIO: "
read nombre 
echo "ENCANTADO DE CONOCERTE, $nombre"
perl -pi -e "s[A TODOS][$nombre]g" /etc/VPS-ARG/bienvenido.txt
echo  "NOMBRE ACTUALIZADO"
echo "REDIRIGIENDO AL INICIÓ"
sleep 5
VPS-ARG
