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
echo -ne "  \033[1;33m[\033[1;31m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\033[1;33m] - \033[1;32m OK \033[0m\n"
sleep 1s
}
##PAKETES
echo ""
echo -e "\033[97m    ◽️ INTENTANDO DETENER UPDATER SECUNDARIO ⏹️" 
fun_bar " killall apt apt-get > /dev/null 2>&1 "

chmod -R 777 /etc/VPS-ARG
clear
clear
echo -e "\e[032m                   ACTUALIZACION COPLETA"
echo -e "\e[032m               Correccion de errores y bugs"
msg -ne "Enter Para Continuar" && read enter
VPS-ARG
