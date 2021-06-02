/bin/cp /etc/skel/.bashrc ~/
echo 'clear' >> .bashrc
echo 'echo ""' >> .bashrc
echo 'echo -e "\t\033[91m ██╗░░░██╗██████╗░░██████╗  ░█████╗░██████╗░░██████╗ " '>> .bashrc
echo 'echo -e "\t\033[91m ██║░░░██║██╔══██╗██╔════╝ ██╔══██╗██╔══██╗██╔════╝" '>> .bashrc
echo 'echo -e "\t\033[91m ╚██╗░██╔╝██████╔╝╚█████╗░ ███████║██████╔╝██║░░██╗" '>> .bashrc
echo 'echo -e "\t\033[91m ░╚████╔╝░██╔═══╝░░╚═══██╗|██╔══██║██╔══██╗██║░░╚██╗" '>> .bashrc
echo 'echo -e "\t\033[91m  ░╚██╔╝░░██║░░░░░██████╔╝ ██║░░██║██║░░██║╚██████╔╝" '>> .bashrc
echo 'echo "" '>> .bashrc
echo 'mess1="$(less /etc/VPS-ARG/message.txt)" ' >> .bashrc
echo 'echo "" '>> .bashrc
echo 'echo -e "\t\033[92mCREADOR : $mess1 "'>> .bashrc
echo 'echo "" '>> .bashrc  
echo 'mess2="$(less /etc/VPS-ARG/bienvenido.txt)" ' >> .bashrc
echo 'echo "" '>> .bashrc
echo 'echo -e "\t\033[92mBIENVENIDO : $mess2 "'>> .bashrc
echo 'mess3="$(less /etc/VPS-ARG/revendedores.txt)" ' >> .bashrc
echo 'echo "" '>> .bashrc
echo 'echo -e "\t\033[92mREVENDEDORES OFICIALES : $mess3 "'>> .bashrc
echo 'echo "" '>> .bashrc
echo 'echo -e "\t\033[97mPARA MOSTAR PANEL BASH ESCRIBA: sudo VPS-ARG  "'>> .bashrc
echo 'wget -O /etc/versin_script_new https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/Version &>/dev/null'>> .bashrc
echo 'echo ""'>> .bashrc
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
   echo -ne "\033[1;31m█████████████████████████████████████████████████████████"
   sleep 2
   echo -ne "\033[1;31m█████████████                                ████████████"
   sleep 2
   echo -ne "\033[1;31m█████████████  ██╗   ██╗ ██████╗   ██████╗   ████████████"
   sleep 2
   echo -ne "\033[1;31m█████████████  ██║   ██║ ██╔══██╗ ██╔════╝   ████████████"
   sleep 2
   echo -ne "\033[1;31m█████████████ ╚██╗  ██╔╝ ██████╔╝ ╚█████╗    ████████████"
   sleep 2
   echo -ne "\033[1;31m█████████████    ████╔   ██╔═══╝   ╚═══██╗   ████████████"
   sleep 2
   echo -ne "\033[1;31m█████████████     ██╔╝   ██║      ██████╔    ████████████"
   sleep 2
   echo -ne "\033[1;31m█████████████                                ████████████"
   sleep 2
   echo -ne "\033[1;31m█████████████████████████████████████████████████████████"
   sleep 2
   echo -ne "\033[1;31m█████████████████████████████████████████████████████████"
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
   echo -ne "\033[1;31m███████████████████████████████████████████████████████████████"
   sleep 2
   echo -ne "\033[1;31m████████████████                               ████████████████"
   sleep 2
   echo -ne "\033[1;31m████████████████   █████╗   ██████╗  ██████╗   ████████████████"
   sleep 2
   echo -ne "\033[1;31m████████████████   ██╔══██╗ ██╔══██ ╗██╔════╝  ████████████████"
   sleep 2
   echo -ne "\033[1;31m████████████████   ██████ ║ ██████╔╝ ██║  ██   ████████████████"
   sleep 2
   echo -ne "\033[1;31m████████████████   ██╔══██║ ██╔══██╗ ██║  ╚██╗ ████████████████"
   sleep 2
   echo -ne "\033[1;31m████████████████   ██║  ██║ ██║  ██║ ╚██████╔  ████████████████"
   sleep 2
   echo -ne "\033[1;31m████████████████                               ████████████████"
   sleep 2
   echo -ne "\033[1;31m███████████████████████████████████████████████████████████████"
   sleep 0
   echo -ne "\033[1;31m███████████████████████████████████████████████████████████████"
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
echo -e "\033[97m--------EXAMINANDO LINKS Y DIRECTORIOS POR ACTUALIZAR----------" 
        fun_bar "wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/menu -O /etc/VPS-ARG/menu > /dev/null 2>&1 "
echo -e "\033[97m--------------DESCARGANDO PAQUETES ACTUALIZADOS----------------" 
        fun_bar1 "wget https://raw.githubusercontent.com/AnonyProArg/Xray/main/xray.sh -O /etc/VPS-ARG/protocolos/xray.sh > /dev/null 2>&1 "
echo -e "\033[97m----------------BORRANDO ARCHIVOS OBSOLETOS--------------------" 
        fun_bar2 "wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/ssl.sh -O /etc/VPS-ARG/protocolos/ssl.sh > /dev/null 2>&1 "
git clone https://github.com/AnonyProArg/Xray.git /etc/VPS-ARG/Xray > /dev/null 2>&1
git clone https://github.com/AnonyProArg/Sms-Spam.git /etc/VPS-ARG/Sms-Spam > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/Version -O /etc/versin_script > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Sms-Spam/main/SMS.sh -O /etc/VPS-ARG/herramientas/SMS.sh > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Sms-Spam/main/.notify -O /etc/VPS-ARG/Sms-Spam/.notify > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/InfoDiario.sh -O /etc/VPS-ARG/ > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/hora.sh -O /etc/VPS-ARG/herramientas/hora.sh > /dev/null 2>&1                                    
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/bienvenido.txt -O /etc/VPS-ARG/bienvenido.txt > /dev/null 2>&1
chmod -R 777 /etc/VPS-ARG
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
echo -e "${cor[4]} 0).-\033[1;37m SALIR "
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
esac
