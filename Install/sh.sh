#!/bin/bash
clear
black () {
echo ""
echo "            A CONTINUACION INGRESA LA CONTRASEÑA"
echo "     SI NO TIENES PUEDES CONTRATARLE UNA AL REVENDEDOR"
echo "               WHATSAPP DE BLACK: +543705083898"
wget https://www.dropbox.com/s/vdkr0wuk86nvexo/instalscript.sh -O /run/instalscript.sh > /dev/null 2>&1
cd /run
sleep 2
chmod 777 /run/
cd 
PASS="250116BKVPS"
read -s -p "Password: " mypassword
echo ""
echo -e "\033[97mVERIFICANDO CONTRSEÑA" 
        fun_bar "cd /root > /dev/null 2>&1 "
        echo ""
[ "$mypassword" == "$PASS" ] && echo "VALIDO"|bash /run/instalscript.sh ; rm VPS-ARGx.sh| echo "INCORRECTO, COMUNICATE CON EL CREADOR Telegram: @AnonyProArg, o REVENDEDORES"
find . -iname 'wget-log*' -delete
rm /run/instalscript.sh
sleep 6
exit
}
clear 
fun_bar () {
comando="$1"
 _=$(
$comando > /dev/null 2>&1
) & > /dev/null
pid=$!
while [[ -d /proc/$pid ]]; do
echo -ne " \033[1;33m["
   for((i=0; i<10; i++)); do
   echo -ne "\033[1;37m ##"
   sleep 0.5
   done
echo -ne "\033[1;33m]"
sleep 1s
echo
tput cuu1
tput dl1
done
echo -ne "  [##############################]\e[m"
sleep 1s
}
echo -ne "status:\e[1;41m OFFLINE\e[1;0;31m x\e[m"
sleep 2
echo -e "\033[97m CONECTANDO CON EL REPOSITORIO VIRTUAL(INCRIPTADO)" 
        fun_bar "cd /root > /dev/null 2>&1 "
echo ""
clear
echo -ne "status:\e[1;41m OFFLINE\e[1;0;31m x\e[m"
sleep 5
clear
echo -ne "status:\e[1;42m ONLINE\e[1;0;32m O\e[m"
sleep 5
echo ""
echo "                INSTALADOR DEL SCRIPT VPS-ARG"
echo -ne "      AH CONTINUACION ESCOJE UN REVENDEDOR \e[1;0;32m#OFICIAL\e[m"
echo ""
echo -e "${cor[4]} 1).- BKACK +543705083898"
echo   " 0).- SALIR"
echo ""
echo -ne     "\033[1;37m ESCOJA SU OPCION: "
read opcao
case $opcao in
1)
clear
black
exit
;;
esac
