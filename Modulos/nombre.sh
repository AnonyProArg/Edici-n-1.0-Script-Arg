#!/bin/bash
clear
echo  "SOLO UN CAMBIO POR ACTUALIZACIÓN"
echo -e "ESCRIBE TU NOMBRE PARA EL INICIO: "
read nombre 
echo "ENCANTADO DE CONOCERTE, $nombre"
perl -pi -e "s[USUARIO][$nombre]g" /etc/VPS-ARG/bienvenido.txt
echo ""
echo -e "NOMBRE EN VPS (SUPERFICIAL): "
read nombree
perl -pi -e "s[USER][$nombree]g" /root/.bashrc
echo "SE RECOMIENDA SALIR Y ENTRAR NUEVAMENTE"
echo  "NOMBRES ACTUALIZADOS"
echo "REDIRIGIENDO AL INICIÓ"
sleep 5
VPS-ARG
