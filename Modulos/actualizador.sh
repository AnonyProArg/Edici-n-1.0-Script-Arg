#!/bin/bash
#25/01/2021 by AnonyProArg
clear
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

fun_bar2 () {
comando="$1"
 _=$(
$comando > /dev/null 2>&1
) & > /dev/null
pid=$!
while [[ -d /proc/$pid ]]; do
echo -ne " \033[1;33m["
   for((i=0; i<20; i++)); do
   echo -ne "\033[1;34m ☆         ✩          ✼          ⚝          ⍟         ✪          ۞       ✹"
   sleep 0.5
   done
echo -ne "\033[1;33m]"
sleep 1s
echo
tput cuu1
tput dl1
done
echo -ne ""
sleep 1s
}
fun_bar () {
comando="$1"
 _=$(
$comando > /dev/null 2>&1
) & > /dev/null
pid=$!
while [[ -d /proc/$pid ]]; do
echo -ne " \033[1;33m["
   for((i=0; i<25; i++)); do
   sleep 2             
   echo -ne "\e[1;37m████    ████    ████    ████"
   sleep 0
   done
echo -ne "\033[1;33m]"
sleep 1s
echo
tput cuu1
tput dl1
done
echo -ne ""
sleep 1s
}
fun_bar1 () {
comando="$1"
 _=$(
$comando > /dev/null 2>&1
) & > /dev/null
pid=$!
while [[ -d /proc/$pid ]]; do
echo -ne " \033[1;33m["
   for((i=0; i<25; i++)); do
   sleep 2
   echo -ne "\033[1;31m████------████------████------████------████------████-----████------████"
   sleep 0
   done
echo -ne "\033[1;33m]"
sleep 1s
echo
tput cuu1
tput dl1
done 
echo -ne ""
sleep 1s
}
vps_2 () {
clear
VPS-ARG
}
vps () {
clear
echo "   VPS SEMANALMENTE POR 5-7 DAIS (PARA PRUEBAS) RESET 00:00 ARG"
echo ""
echo "se permite el cambio de contraseña"
echo ""
echo "IP: 209.151.146.205"
echo "CONTRASEÑA: 6r5624dg"
echo ""
echo " 2da VPS"
echo ""
echo "IP: 209.151.150.231"
echo "CONTRASEÑA: 9h324kg4"
echo
echo "REDIRIGIENDO AL INICIO EN 10s"
sleep 10s
VPS-ARG
}
lista () {
clear
echo "       LISTA DE REVENDEDORES ( PROXIMAMENTE ) "
echo ""
echo " VOLVIENDO AL MENU..."
sleep 5
VPS-ARG
}
ssl_stunel () {
clear
##PAKETES
echo ""
echo -e "\033[97m--------EXAMINANDO LINKS Y DIRECTORIOS POR ACTUALIZAR----------" 
        fun_bar "wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/menu -O /etc/VPS-ARG/menu > /dev/null 2>&1 "
echo -e "\033[97m--------------DESCARGANDO PAQUETES ACTUALIZADOS----------------" 
        fun_bar1 "wget https://raw.githubusercontent.com/AnonyProArg/Xray/main/xray.sh -O /etc/VPS-ARG/protocolos/xray.sh > /dev/null 2>&1 "
git clone https://github.com/AnonyProArg/Xray.git /etc/VPS-ARG/Xray > /dev/null 2>&1
git clone https://github.com/AnonyProArg/Sms-Spam.git /etc/VPS-ARG/Sms-Spam > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/Version -O /etc/versin_script > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Sms-Spam/main/SMS.sh -O /etc/VPS-ARG/herramientas/SMS.sh > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Sms-Spam/main/.notify -O /etc/VPS-ARG/Sms-Spam/.notify > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/InfoDiario.sh -O /etc/VPS-ARG/ > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/hora.sh -O /etc/VPS-ARG/herramientas/hora.sh > /dev/null 2>&1                                    
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/bienvenido.txt -O /etc/VPS-ARG/bienvenido.txt > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/tcp.sh -O /etc/VPS-ARG/herramientas/tcp.sh > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/speed.sh -O /etc/VPS-ARG/herramientas/speed.sh > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/aumentar.sh -O /etc/VPS-ARG/herramientas/aumentar.sh  > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/VPS-ARG.1 -O //usr/bin/VPS-ARG > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Trojan/main/xwall.sh -O  /etc/VPS-ARG/protocolos/xwall.sh > /dev/null 2>&1
cd /var/run
mkdir screen > /dev/null 2>&1
chmod -R 777 screen
cd screen
mkdir S-root > /dev/null 2>&1
chmod -R 700 S-root
echo -e "\033[97m----------------BORRANDO ARCHIVOS OBSOLETOS--------------------" 
        fun_bar2 "wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/ssl.sh -O /etc/VPS-ARG/protocolos/ssl.sh > /dev/null 2>&1 "
chmod -R 777 /etc/VPS-ARG
chmod -R 777 //usr/bin
find . -iname 'wget-log*' -delete
find . -iname 'instalscript.sh*' -delete
echo -e "\033[97m-----------------------------------------------------------------------------------"
echo -e "\e[032m                               ACTUALIZACION COMPLETA"
echo -e "\e[032m                            Correccion de errores y bugs"
msg -ne "Enter Para Continuar"
VPS-ARG
}
clear
ssl_multi () {
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/diario.sh -O /etc/VPS-ARG/diario.sh > /dev/null 2>&1 
chmod -R 777 /etc/VPS-ARG
bash /etc/VPS-ARG/diario.sh
}
clear
msg -bar
msg -bar3
msg -tit
echo -e "${cor[3]}              MENU DE ACTUALIZACIONES"
msg -bar
echo -e "${cor[4]} 1).-\033[1;37m DIARIO DEL DESARROLLADOR "
echo -e "${cor[4]} 2).-\033[1;37m ACTUALIZAR SCRIPT   "
echo -e "${cor[4]} 3).-\033[1;37m LIST REVENDEDORES   "
echo -e "${cor[4]} 4).-\033[1;37m VPS NUEVA PARA PRUEBAS (GRATIS)"
echo -e "${cor[4]} 0).-\033[1;37m MENU-INICIO"
msg -bar
echo -ne "\033[1;37m DIGITE LA OPCIÓN: "
read opcao
case $opcao in
2)
msg -bar
ssl_stunel
;;
1)
msg -bar
ssl_multi
;;
3)
lista
;;
4)
vps
;;
0)
vps_2
;;
esac
