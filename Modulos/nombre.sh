#!/bin/bash
clear
echo  "SOLO UN CAMBIO POR ACTUALIZACIÓN"
echo -e "ESCRIBE TU NOMBRE PARA EL INICIO: "
read nombre 
echo "ENCANTADO DE CONOCERTE, $nombre"
perl -pi -e "s[USUARIO][$nombre]g" /etc/VPS-ARG/bienvenido.txt
perl -pi -e "s[USER][$nombre]g" /root/.bashrc
echo  "NOMBRE ACTUALIZADO"
echo "REDIRIGIENDO AL INICIÓ"
sleep 5
VPS-ARG
