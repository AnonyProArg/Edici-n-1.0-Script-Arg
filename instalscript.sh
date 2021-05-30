
#!/bin/bash 
mkdir /etc/VPS-ARG 
mkdir /etc/VPS-ARG/controlador 
mkdir /etc/VPS-ARG/protocolos 
mkdir /etc/VPS-ARG/herramientas 
mkdir /etc/VPS-ARG/Spam_Sms_mundial
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/message.txt -O /etc/VPS-ARG/message.txt
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/menu -O /etc/VPS-ARG/menu 
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/usercodes -O /etc/VPS-ARG/controlador/usercodes 
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/C-SSR.sh -O /etc/VPS-ARG/protocolos/C-SSR.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/sockspy.sh -O /etc/VPS-ARG/protocolos/sockspy.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/ssl.sh -O /etc/VPS-ARG/protocolos/ssl.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/PDirect.py -O /etc/VPS-ARG/protocolos/PDirect.py
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/PGet.py -O /etc/VPS-ARG/protocolos/PGet.py
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/POpen.py -O /etc/VPS-ARG/protocolos/POpen.py
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/PPriv.py -O /etc/VPS-ARG/protocolos/PPriv.py
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/PPub.py -O /etc/VPS-ARG/protocolos/PPub.py
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/Shadowsocks-R.sh -O /etc/VPS-ARG/protocolos/Shadowsocks-R.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/Shadowsocks-libev.sh -O /etc/VPS-ARG/protocolos/Shadowsocks-libev.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/budp.sh -O /etc/VPS-ARG/protocolos/budp.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/dropbear.sh -O /etc/VPS-ARG/protocolos/dropbear.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/openvpn.sh -O /etc/VPS-ARG/protocolos/openvpn.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/shadowsocks.sh -O /etc/VPS-ARG/protocolos/shadowsocks.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/squid.sh -O /etc/VPS-ARG/protocolos/squid.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/v2ray.sh -O /etc/VPS-ARG/protocolos/v2ray.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/ADMbot.sh -O /etc/VPS-ARG/herramientas/ADMbot.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/Unlock-Pass-VULTR.sh -O /etc/VPS-ARG/herramientas/ Unlock-Pass-VULTR.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/apacheon.sh -O /etc/VPS-ARG/herramientas/apacheon.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/blockBT.sh -O /etc/VPS-ARG/herramientas/blockBT.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/dns-netflix.sh -O /etc/VPS-ARG/herramientas/dns-netflix.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/fai2ban.sh -O /etc/VPS-ARG/herramientas/fai2ban.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/gestor.sh -O /etc/VPS-ARG/herramientas/gestor.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/lista-arq -O /etc/VPS-ARG/herramientas/lista-arq
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/paysnd.sh -O /etc/VPS-ARG/herramientas/paysnd.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/speed.sh -O /etc/VPS-ARG/herramientas/speed.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/speedtest.py -O /etc/VPS-ARG/herramientas/speedtest.py
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/ports.sh -O /etc/VPS-ARG/herramientas/ports.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/tcp.sh -O /etc/VPS-ARG/herramientas/tcp.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/ultrahost -O /etc/VPS-ARG/herramientas/ultrahost
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/utils.sh -O /etc/VPS-ARG/herramientas/utils.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/ports.sh -O /etc/VPS-ARG/herramientas/ports.sh
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/blockBT.sh -O /etc/VPS-ARG/herramientas/blockBT.sh 
wget https://raw.githubusercontent.com/AnonyProArg/Spam_Sms_mundial/main/SMS_SPAM -O /etc/VPS-ARG/herramientas/SMS_SPAM
git clone https://github.com/AnonyProArg/Spam_Sms_mundial /etc/VPS-ARG/Spam_Sms_mundial
chmod -R 777 /etc/VPS-ARG
rm -rf /root/instalscript.sH
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
  "-bar2"|"-bar")cor="${VERMELHO}————————————————————————————————————————————————————" && echo -e "${SEMCOR}${cor}${SEMCOR}";;
 esac
}
clear
 msg -bar2
 msg -ama "     [ VPS - AR - SCRIPT \033[1;97m By:AnonyProArg \033[1;33m ]"
 msg -bar2
## Install/Interno
	echo -e  "\033[1;97m              Copiando Instalador Interno "
	echo "           --------------------------------"
	sleep 2
	rm -rf /root/VPS-ARG
    wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/VPS-ARG -O /root/VPS-ARG &> /dev/null
	chmod +x /root/VPS-ARG
	msg -bar2
	sleep 2

ubu16_fun () {
    wget -O /etc/apt/sources.list https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/Repositorios/16.04/sources.list &> /dev/null
	echo -e "\033[1;97m SELECCIONO UBU 16"
}

ubu18_fun () {
    wget -O /etc/apt/sources.list https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/Repositorios/18.04/sources.list &> /dev/null
	echo -e "\033[1;97m OK UBU 18"
}	

otro_fun () {
    
	echo "Ubuntu 20.04"
}
otro_fun2 () {
    
	echo "OK IGNORAR ESTE PASO"
}
echo -e "\e[1;100mRECUERDA QUE ESTE SCRIPT ES TOTALMENTE GRATUITO\nESTA TOTALMENTE PROHIBIDA SU VENTA\nCOMPARTE PARA LLEGAR A MAS -\nARGENTINOS 😎🇦🇷\e[0m"
msg -bar
	echo -e "\033[1;97m           ---- QUE UBUNTU ESTA USANDO ----"
	echo -e "\033[1;97m  Digite solo el numero segun su respuesta: "
    msg -bar
    echo -e "\033[1;97m Escoja la opcion deseada. \033[1;93m(Default Opcion 4)\033[0m"
    msg -bar
    echo " 1).- Ubuntu 16.04 "
    echo " 2).- Ubuntu 18.04 "
    echo " 3).- Ubuntu 20.04 "
    echo " 4).- Ignorar Este Paso"
	msg -bar
	echo -n "Digite solo el numero segun su respuesta: "
    read opcao
    case $opcao in
    1)
    ubu16_fun 
    ;;
    2)
    ubu18_fun
    ;;
    3)
    otro_fun
    ;;
    4)
    otro_fun2
    ;;
    esac
	
sleep 1
## Restore working directory
clear
cd && ./VPS-ARG
