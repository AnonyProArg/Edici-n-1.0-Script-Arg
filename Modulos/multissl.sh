#!/bin/bash
#    .---------- constant part!
#    vvvv vvvv-- the code from above
RED='\033[0;31m'
NC='\033[0m' # No Color
clear
clear
printf "${NC}+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
echo -e ""
printf "${RED}INSTALADOR MULTISSL By AnonyProArg 🇦🇷\n"
echo -e ""
printf "${NC}+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
echo -e ""
printf "${RED}DEBES INSTALAR ESTE SCRIPT DESDE UNA VPS TOTALMENTE LIMPIA SIN USAR LOS PUERTOS 443 80 22"
echo -e ""
printf "${NC}+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
echo -e ""
printf "${RED}INSTANDO PYTHON DIRECT MODIFICADO..."
echo -e ""
printf "${NC}+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
screen -dmS Pydirect python /etc/VPS-ARG/protocolos/PDirect.py 80
printf "${RED}Se instalará SSL en puerto 443 redirecionado a python 80"
echo -e ""
printf "${NC}+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
echo -e ""
printf "${RED}Instalando SSL"
echo -e ""
printf "${NC}+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
apt-get install stunnel4 -y
apt-get install stunnel4 -y > /dev/null 2>&1
echo -e "client = no\n[SSL]\ncert = /etc/stunnel/stunnel.pem\naccept = 443\nconnect = 127.0.0.1:80" > /etc/stunnel/stunnel.conf
openssl genrsa -out stunnel.key 2048 > /dev/null 2>&1

(echo "US" ; echo "California" ; echo "San Francisco" ; echo "Cloudflare, inc." ; echo "" ; echo "sni.cloudflaressl.com" ; echo "" )|openssl req -new -key stunnel.key -x509 -days 1000 -out stunnel.crt > /dev/null 2>&1

cat stunnel.crt stunnel.key > stunnel.pem 

mv stunnel.pem /etc/stunnel/
######-------
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
service stunnel4 restart > /dev/null 2>&1
printf "${NC}+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
echo -e ""
printf "${RED}INSTALADO STUNNEL4 CON EXITO"
echo -e ""
printf "${NC}+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
rm -rf /etc/ger-frm/stunnel.crt > /dev/null 2>&1
rm -rf /etc/ger-frm/stunnel.key > /dev/null 2>&1
rm -rf /root/stunnel.crt > /dev/null 2>&1
rm -rf /root/stunnel.key > /dev/null 2>&1
printf "${NC}+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
echo -e ""
printf "${RED}INSTALACION FINALIZADA"