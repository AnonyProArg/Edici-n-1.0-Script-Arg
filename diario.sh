#!/bin/bash
clear
SCPdir="/etc/VPS-ARG"
SCPfrm="${SCPdir}/herramientas" && [[ ! -d ${SCPfrm} ]] && exit
SCPinst="${SCPdir}/protocolos"&& [[ ! -d ${SCPinst} ]] && exit
declare -A cor=( [0]="\033[1;37m" [1]="\033[1;34m" [2]="\033[1;31m" [3]="\033[1;33m" [4]="\033[1;32m" )
dirapache="/usr/local/lib/ubuntn/apache/ver" && [[ ! -d ${dirapache} ]] && exit
mportas () {
unset portas
portas_var=$(lsof -V -i tcp -P -n | grep -v "ESTABLISHED" |grep -v "COMMAND" | grep "LISTEN")
while read port; do
var1=$(echo $port | awk '{print $1}') && var2=$(echo $port | awk '{print $9}' | awk -F ":" '{print $2}')
[[ "$(echo -e $portas|grep "$var1 $var2")" ]] || portas+="$var1 $var2\n"
done <<< "$portas_var"
i=1
echo -e "$portas"

}
msg -bar
msg -bar3
msg -tit
date "+FECHA: %D%nHORA: %T"   
msg -bar                                                                                                
echo -e "  \033[100m     DIARIO DEL DESARROLADOR " 
msg -bar 
echo -ne " -   SE ACABA DE INCORPORAR VPS DE PRUEBAS(GRATIS Y DIARIAS)\n"
echo -ne " -   ACTUALMENTE ESTOY ARREGLANDO ERRORES\n"
echo -ne " -   YA CONTAMOS CON TELEGRAM PARA CONSULTAS @AnonyProArg\n"
echo -ne " -   TAMBIEN AUMENTANDO LA COMPATIBILIDAD\n"
echo -ne " -   EN ESTOS DIAS ESTARE AGREGANDO ALGO NUEVO, MANTENTE ATENT@\n"
echo ""
msg -bar 
echo -e "  \033[100m      DATOS DE LAS ACTUALIZACIONES " 
msg -bar 
echo -ne " -   DATA DE LA V-1.5= MEJORAS DE INTERFAZ Y NUEVA HERRAMIENTA :) \n"
echo -ne " -   DATA DE LA V-1.4= MEJORAS Y UNA NUEVA FUNCIÓN EN HERRAMIENTAS\n"
echo -ne " -   DATA DE LA V-1.3= TERMINE DE MODIFICAR EL ACTUALIZADOR (POR EL MOMENTO)\n"
msg -bar 
echo -ne " -   GRACIAS POR PASARTE, VUELVE PRONTO\n"
msg -bar
msg -ne "Enter Para Continuar" && read enter
VPS-ARG
