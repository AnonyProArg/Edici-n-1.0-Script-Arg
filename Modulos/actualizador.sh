fun_bar () {
comando="$1"
 _=$(
$comando > /dev/null 2>&1
) & > /dev/null
pid=$!
while [[ -d /proc/$pid ]]; do
echo -ne "  \033[1;33m["
   for((i=0; i<40; i++)); do
   echo -ne "\033[1;31m>"
   sleep 0.1
   done
echo -ne "\033[1;33m]"
sleep 1s
echo
tput cuu1 && tput dl1
done
echo -ne "  \033[1;33m[\033[1;31mtu☞(　-_･) ︻デ═一 ▸▸ ▸▸▸▸ ▸▸▸ ▸▸▸▸ ▸▸▸▸ ▸▸▸▸ ▸▸▸(x_x)☜tu ex\033[1;33m] - \033[1;32m OK \033[0m\n"
sleep 1s
}
##PAKETES
echo ""
echo -e "\033[97m     EXAMINANDO LINKS Y DIRECTORIOS POR ACTUALIZAR" 
        fun_bar " apt upgrade     /dev/null 2>&1 "
echo -e "\033[97m        DESCARGANDO PAQUETES ACTUALIZADOS" 
        fun_bar " wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/menu -O /etc/VPS-ARG/menu
wget https://raw.githubusercontent.com/AnonyProArg/Xray/main/xray.sh -O /etc/VPS-ARG/protocolos/xray.sh
git clone https://github.com/AnonyProArg/Xray.git /etc/VPS-ARG/Xray
git clone https://github.com/AnonyProArg/Sms-Spam.git /etc/VPS-ARG/Sms-Spam
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/Version -O /etc/versin_script
wget https://raw.githubusercontent.com/AnonyProArg/Sms-Spam/main/SMS.sh -O /etc/VPS-ARG/herramientas/SMS.sh
wget https://raw.githubusercontent.com/AnonyProArg/Sms-Spam/main/.notify -O /etc/VPS-ARG/Sms-Spam/.notify apt-get >    /dev/null 2>&1 "
echo -e "\033[97m      BORRANDO ARCHIVOS OBSOLETOS" 
        fun_bar " apt update /dev/null 2>&1 "
chmod -R 777 /etc/VPS-ARG
clear
clear
echo -e "\e[032m                   ACTUALIZACION COPLETA"
echo -e "\e[032m               Correccion de errores y bugs"
msg -ne "Enter Para Continuar" && read enter
VPS-ARG
