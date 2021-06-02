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
   echo -ne "\033[1;31m ☆         ✩          ✼          ⚝          ⍟         ✪          ۞       ✹"
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
   for((i=0; i<1; i++)); do
   sleep 2
   echo -ne "\033[1;31m█████████████████████████████████████████████████████████████████████████████████"
   sleep 2
   echo -ne "\033[1;31m█████████████████████████████                              ████████████████████████"
   sleep 2
   echo -ne "\033[1;31m████████████████████████████  ██╗   ██╗ ██████╗   ██████╗ ████████████████████████"
   sleep 2
   echo -ne "\033[1;31m██████████████████████████████  ██║   ██║ ██╔══██╗ ██╔════╝ ████████████████████████"
   sleep 2
   echo -ne "\033[1;31m█████████████████████████████  ╚██╗ ██╔╝ ██████╔╝ ╚█████╗  ████████████████████████"
   sleep 2
   echo -ne "\033[1;31m█████████████████████████████    ████╔╝  ██╔═══╝   ╚═══██╗ ████████████████████████"
   sleep 2
   echo -ne "\033[1;31m█████████████████████████████     ██╔╝   ██║      ██████╔  ████████████████████████"
   sleep 2
   echo -ne "\033[1;31m██████████████████████████████                              ████████████████████████"
   sleep 2
   echo -ne "\033[1;31m██████████████████████████████████████████████████████████████████████████████████"
   sleep 2
   echo -ne "\033[1;31m██████████████████████████████████████████████████████████████████████████████████"
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
   for((i=0; i<1; i++)); do
   sleep 2
   echo -ne "\033[1;31m███████████████████████████████████████████████████████████████████████████"
   sleep 2
   echo -ne "\033[1;31m██████████████████████████                                 █████████████████████"
   sleep 2
   echo -ne "\033[1;31m██████████████████████████  █████╗   ██████╗  ██████╗   █████████████████████"
   sleep 2
   echo -ne "\033[1;31m█████████████████████████  ██╔══██╗ ██╔══██ ╗██╔════╝  █████████████████████"
   sleep 2
   echo -ne "\033[1;31m█████████████████████████  ██████ ║ ██████╔╝ ██║  ██    █████████████████████"
   sleep 2
   echo -ne "\033[1;31m█████████████████████████  ██╔══██║ ██╔══██╗ ██║  ╚██╗  █████████████████████"
   sleep 2
   echo -ne "\033[1;31m██████████████████████████  ██║  ██║ ██║  ██║ ╚██████╔  █████████████████████"
   sleep 2
   echo -ne "\033[1;31m██████████████████████████                                  █████████████████████"
   sleep 2
   echo -ne "\033[1;31m██████████████████████████████████████████████████████████████████████████████████"
   sleep 0
   echo -ne "\033[1;31m██████████████████████████████████████████████████████████████████████████████████"
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
ssl_stunel () {
clear
##PAKETES
echo ""
echo -e "\033[97m------------------EXAMINANDO LINKS Y DIRECTORIOS POR ACTUALIZAR--------------------" 
        fun_bar "wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/menu -O /etc/VPS-ARG/menu > /dev/null 2>&1 "
echo -e "\033[97m------------------------DESCARGANDO PAQUETES ACTUALIZADOS--------------------------" 
        fun_bar1 "wget https://raw.githubusercontent.com/AnonyProArg/Xray/main/xray.sh -O /etc/VPS-ARG/protocolos/xray.sh > /dev/null 2>&1 "
echo -e "\033[97m--------------------------BORRANDO ARCHIVOS OBSOLETOS-----------------------------" 
        fun_bar2 "wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/ssl.sh -O /etc/VPS-ARG/protocolos/ssl.sh > /dev/null 2>&1 "
git clone https://github.com/AnonyProArg/Xray.git /etc/VPS-ARG/Xray > /dev/null 2>&1
git clone https://github.com/AnonyProArg/Sms-Spam.git /etc/VPS-ARG/Sms-Spam > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/Version -O /etc/versin_script > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Sms-Spam/main/SMS.sh -O /etc/VPS-ARG/herramientas/SMS.sh > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Sms-Spam/main/.notify -O /etc/VPS-ARG/Sms-Spam/.notify > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/InfoDiario.sh -O /etc/VPS-ARG/ > /dev/null 2>&1
chmod -R 777 /etc/VPS-ARG
find . -iname 'wget-log*' -delete
find . -iname 'instalscript.sh*' -delete
echo -e "\033[97m-----------------------------------------------------------------------------------"
echo -e "\e[032m                               ACTUALIZACION COMPLETA"
echo -e "\e[032m                            Correccion de errores y bugs"
msg -ne "Enter Para Continuar" && read enter
VPS-ARG


ssl_multi () {
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/diario.sh -O /etc/VPS-ARG/diario.sh > /dev/null 2>&1 
chmod -R 777 /etc/VPS-ARG
bash /etc/VPS-ARG/diario.sh

mx () {
clear 
rm /etc/localtime
ln -s /usr/share/zoneinfo/America/Mexico_City /etc/localtime > /dev/null 2>&1
echo "HORA ACTULIZADA"
msg -ne "Enter Para Continuar" && read enter
VPS-ARG

ar () {
clear
rm /etc/localtime
ln -s /usr/share/zoneinfo/America/Buenos_Aires /etc/localtime > /dev/null 2>&1
echo "HORA ACTULIZADA"
msg -ne "Enter Para Continuar" && read enter
VPS-ARG


hora () {
clear 
msg -bar
msg -bar3
msg -tit
echo -e "${cor[3]}         MENU DE HORARIOS (LA) PARA ACTUALIZAR "
msg -bar
echo -e "${cor[4]} 1).-\033[1;37m ARGENTINA, BRASIL, CHILE, URUGUAY "
echo -e "${cor[4]} 2).-\033[1;37m MÉXICO, PANAMÁ, LIMA, BOGOTÁ, ETC"
msg -bar
echo -ne     "\033[1;37mESCOJA SU OPCION: "
read opcao
case $opcao in
1)
msg -bar
ar
;;
2)
msg -bar
mx
;;
esac
}
clear
msg -bar
msg -bar3
msg -tit
echo -e "${cor[3]}         MENU DE ACTUALIZACIONES "
msg -bar
echo -e "${cor[4]} 1).-\033[1;37m DIARIO DEL DESAROLLADOR "
echo -e "${cor[4]} 2).-\033[1;37m ACTUALIZAR SCRIPT "
echo -e "${cor[4]} 3).-\033[1;37m ACTUALÍZAR HORA DEL VPS "
echo -e "${cor[3]} 0).-\033[1;37m SALIR "
msg -bar
echo -ne     "\033[1;37mESCOJA SU OPCION: "
read opcao
case $opcao in
1)
msg -bar
ssl_multi
;;
3)
msg -bar
hora
;;
2)
msg -bar
ssl_stunel
sleep 3
exit
;;
esac
