#!/bin/bash

intro () {
echo " En construccion..."

}
exit () {
exit

}
iniciar () {
echo -e "ESCRIBE TU NOMBRE PARA EL INICIO: "
read nombre 
echo "ENCANTADO DE CONOCERTE, $nombre"
perl -pi -e "s[USUARIO][$nombre]g" /etc/VPS-ARG/bienvenido.txt
echo ""
}

echo -e "${cor[3]} "Welcome Nuevamente"
printf "%*s\n" $(( ( $(echo -e "$title" | wc -c ) + 30 ) / 2 )) "$title"
title=`echo -e "\033[1;96m$(cat ${SCPdir}/bienvenido.txt)"`


echo -e "${cor[4]} 1).-Instroduccion "

echo -e "${cor[4]} 2).-Iniciar "

echo -e "${cor[4]} 0).-Salir "
echo -ne "\033[1;37m DIGITE LA OPCIÓN: "
read opcao
case $opcao in
2)
iniciar
;;
1)
intro
;;
0)
exit
;;
esac
