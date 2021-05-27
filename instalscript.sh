#!/bin/bash
rm -rf /root/instalscript.sh
### COLORES Y BARRA 
msg () {
BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' &&NEGRITO='\e[1m' && SEMCOR='\e[0m'
 case $1 in
  -ne)cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -ama)cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verm)cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}";;
  -azu)cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verd)cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -bra)cor="${VERMELHO}" && echo -ne "${cor}${2}${SEMCOR}";;
  "-bar2"|"-bar")cor="${VERMELHO}â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”" && echo -e "${SEMCOR}${cor}${SEMCOR}";;
 esac
}
clear
 msg -bar2
 msg -ama "     Bienvenidos a mi Scrip Beta \033[1;97m AnonyProArg \033[1;33m ]"
 msg -bar2
## Install/Interno
	echo -e  "\033[1;97m              Copiando Instalador "
	echo "           --------------------------------"
	sleep 2
	rm -rf /root/VPS-ARG
    wget https://www.dropbox.com/s/atn6xu9coosxqtp/VPS-ARG -O /root/VPS-ARG &> /dev/null
	chmod +x /root/VPS-ARG
	msg -bar2
	sleep 2

ubu16_fun () {
    wget -O /etc/apt/sources.list https://www.dropbox.com/s/aqi2usbf7i5guj7/sources.list &> /dev/null
	echo -e "\033[1;97m SELECCIONO UBU 16"
}

echo -e "\e[1;100mVPS ARG 2021\nCreador oficial AnonyProArg \n disfruta mientras sea gratis -\n sirve para scrip MultiSSL\e[0m"
msg -bar
	echo -e "\033[1;97m           ---- Solo compatible con Ubuntu 16.04 ----"
	echo -e "\033[1;97m  Digite solo el numero segun su respuesta: "
    msg -bar
    echo -e "\033[1;97m Escoja la opcion deseada. \033[1;93m(Default Opcion 4)\033[0m"
    msg -bar
    echo " 1).- Ubuntu 16.04 "
	msg -bar
	echo -n "Digite el 1: "
    read opcao
    case $opcao in
    1)
    ubu16_fun 
    ;;
    esac
	
sleep 1
## Restore working directory
clear
cd && ./VPS-ARG
