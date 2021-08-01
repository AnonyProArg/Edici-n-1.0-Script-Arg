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

fun_bar () {
comando="$1"
 _=$(
$comando > /dev/null 2>&1
) & > /dev/null
pid=$!
while [[ -d /proc/$pid ]]; do
echo -ne " \033[1;33m["
   for((i=0; i<20; i++)); do
   echo -ne "\033[1;31m##"
   sleep 0.5
   done
echo -ne "\033[1;33m]"
sleep 1s
echo
tput cuu1
tput dl1
done
echo -e " \033[1;33m[\033[1;31m########################################\033[1;33m] - \033[1;32m100%\033[0m"
sleep 1s
}

ssl_stunel () {
[[ $(mportas|grep stunnel4|head -1) ]] && {
echo -e "\033[1;33m $(fun_trans  "Deteniendo Stunnel")"
msg -bar
service stunnel4 stop > /dev/null 2>&1
fun_bar "apt-get purge  stunnel4 -y"
msg -bar
echo -e "\033[1;33m $(fun_trans  "Detenido Con Exito!")"
msg -bar
return 0
}
echo -e "\033[1;32m $(fun_trans  "              INSTALADOR SSL By VPS-ARG")"
msg -bar
echo -e "\033[1;33m $(fun_trans  "Seleccione una puerta de redirección interna.")"
echo -e "\033[1;33m $(fun_trans  "Un puerto SSH/DROPBEAR/SQUID/OPENVPN/SSL")"
msg -bar
         while true; do
         echo -e "\033[1;37m"
         read -p " Local-Port: " portx
		 echo ""
         if [[ ! -z $portx ]]; then
             if [[ $(echo $portx|grep [0-9]) ]]; then
                [[ $(mportas|grep $portx|head -1) ]] && break || echo -e "\033[1;31m Puerto Invalido"
             fi
         fi
         done
msg -bar
DPORT="$(mportas|grep $portx|awk '{print $2}'|head -1)"
echo -e "\033[1;33m   Ahora Que Puerto sera SSL"
msg -bar
    while true; do
	echo -e "\033[1;37m"
    read -p " Listen-SSL: " SSLPORT
	echo ""
    [[ $(mportas|grep -w "$SSLPORT") ]] || break
    echo -e "\033[1;33m Este Puerto esta en Uso"
    unset SSLPORT
    done
msg -bar
echo -e "\033[1;33m $(fun_trans  "Instalando SSL")"
msg -bar
fun_bar "apt-get install stunnel4 -y"
apt-get install stunnel4 -y > /dev/null 2>&1
echo -e "client = no\n[SSL]\ncert = /etc/stunnel/stunnel.pem\naccept = ${SSLPORT}\nconnect = 127.0.0.1:${DPORT}" > /etc/stunnel/stunnel.conf
####Coreccion2.0##### 
openssl genrsa -out stunnel.key 2048 > /dev/null 2>&1

(echo "mx" ; echo "mx" ; echo "mx" ; echo "mx" ; echo "mx" ; echo "mx" ; echo "@vpsarg" )|openssl req -new -key stunnel.key -x509 -days 1000 -out stunnel.crt > /dev/null 2>&1

cat stunnel.crt stunnel.key > stunnel.pem 

mv stunnel.pem /etc/stunnel/
######-------
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
service stunnel4 restart > /dev/null 2>&1
msg -bar
echo -e "\033[1;33m $(fun_trans  "INSTALADO CON EXITO")"
msg -bar
rm -rf /etc/ger-frm/stunnel.crt > /dev/null 2>&1
rm -rf /etc/ger-frm/stunnel.key > /dev/null 2>&1
rm -rf /root/stunnel.crt > /dev/null 2>&1
rm -rf /root/stunnel.key > /dev/null 2>&1
return 0
}
SPR &
ssl_stunel_2 () {
echo -e "\033[1;32m $(fun_trans  "             AGREGAR MAS PUESRTOS SSL")"
msg -bar
echo -e "\033[1;33m $(fun_trans  "Seleccione una puerta de redirección interna.")"
echo -e "\033[1;33m $(fun_trans  "Un puerto SSH/DROPBEAR/SQUID/OPENVPN/SSL")"
msg -bar
         while true; do
         echo -ne "\033[1;37m"
         read -p " Local-Port: " portx
		 echo ""
         if [[ ! -z $portx ]]; then
             if [[ $(echo $portx|grep [0-9]) ]]; then
                [[ $(mportas|grep $portx|head -1) ]] && break || echo -e "\033[1;31m $(fun_trans  "Puerto Invalido")"
             fi
         fi
         done
msg -bar
DPORT="$(mportas|grep $portx|awk '{print $2}'|head -1)"
echo -e "\033[1;33m $(fun_trans  "Ahora Que Puerto sera SSL")"
msg -bar
    while true; do
	echo -ne "\033[1;37m"
    read -p " Listen-SSL: " SSLPORT
	echo ""
    [[ $(mportas|grep -w "$SSLPORT") ]] || break
    echo -e "\033[1;33m $(fun_trans  "Esta puerta está en uso")"
    unset SSLPORT
    done
msg -bar
echo -e "\033[1;33m $(fun_trans  "Instalando SSL")"
msg -bar
fun_bar "apt-get install stunnel4 -y"
echo -e "client = no\n[SSL+]\ncert = /etc/stunnel/stunnel.pem\naccept = ${SSLPORT}\nconnect = 127.0.0.1:${DPORT}" >> /etc/stunnel/stunnel.conf
######-------
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
service stunnel4 restart > /dev/null 2>&1
msg -bar
echo -e "${cor[4]}            INSTALADO CON EXITO"
msg -bar
rm -rf /etc/ger-frm/stunnel.crt > /dev/null 2>&1
rm -rf /etc/ger-frm/stunnel.key > /dev/null 2>&1
rm -rf /root/stunnel.crt > /dev/null 2>&1
rm -rf /root/stunnel.key > /dev/null 2>&1
return 0
}
clear
ssl_multi () {
#!/bin/bash
clear
kill -9 $(lsof -t -i:80) > /dev/null 2>&1
kill -9 $(lsof -t -i:443) > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/PDirect.py -O /etc/VPS-ARG/protocolos/PDirect.py > /dev/null 2>&1
chmod -x /etc/VPS-ARG/protocolos/PDirect.py
msg -bar
echo -e "\033[1;33m Escriba el color del banner en inglés y en minúsculas"
msg -bar
echo ""
    read -p " Escriba : " colour
echo ""
msg -bar
echo -e "\033[1;33m  Texto Banner"
msg -bar
echo ""
    read -p " Escriba : " banner
echo ""
perl -pi -e "s[AnonyProArg][<title><head><h1><font color="$colour">$banner<head>]g" /etc/VPS-ARG/protocolos/PDirect.py
sleep 2
echo ""
msg -bar
echo -e "\033[1;33m  Puerto Python "
msg -bar
echo ""
   read -p "Puerto : " Puerto
echo ""
sleep 2 
screen -dmS Pydirect python /etc/VPS-ARG/protocolos/PDirect.py $Puerto
msg -bar
echo -e "\033[1;33m Ahora Que Puerto sera SSL"
msg -bar
echo ""
  read -p "  Puerto SSL: " sslpoti
msg -bar
echo -e "" 
printf "${RED}Instalando....."
echo -e ""
printf "${NC}+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
apt-get install stunnel4 -y
apt-get install stunnel4 -y > /dev/null 2>&1
echo -e "client = no\n[SSL]\ncert = /etc/stunnel/stunnel.pem\naccept = $sslpoti\nconnect = 127.0.0.1:80" > /etc/stunnel/stunnel.conf
openssl genrsa -out stunnel.key 2048 > /dev/null 2>&1

(echo "US" ; echo "California" ; echo "San Francisco" ; echo "Cloudflare, inc." ; echo "" ; echo "sni.cloudflaressl.com" ; echo "" )|openssl req -new -key stunnel.key -x509 -days 1000 -out stunnel.crt > /dev/null 2>&1

cat stunnel.crt stunnel.key > stunnel.pem 

mv stunnel.pem /etc/stunnel/
######-------
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
service stunnel4 restart > /dev/null 2>&1
echo -e ""
printf "${NC}+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
echo -e ""
rm -rf /etc/ger-frm/stunnel.crt > /dev/null 2>&1
rm -rf /etc/ger-frm/stunnel.key > /dev/null 2>&1
rm -rf /root/stunnel.crt > /dev/null 2>&1
rm -rf /root/stunnel.key > /dev/null 2>&1
printf "${NC}+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
echo -e ""
printf "${RED}INSTALACION FINALIZADA"
echo ""
return 0
}

clear
msg -bar
msg -bar3
msg -tit
echo -e "${cor[3]}       INSTALADOR MONO Y MULTI SSL By AnonyProArg"
msg -bar
echo -e "${cor[1]}            Escoja la opcion deseada."
msg -bar
echo -e "${cor[4]} 1).-\033[1;37m INICIAR O PARAR SSL "
echo -e "${cor[4]} 2).-\033[1;37m AGREGAR PUERTOS SSL   "
echo -e "${cor[4]} 3).-\033[1;37m INSTALADOR PDirect + SSL EditalPort "
echo -e "${cor[4]} 0).-\033[1;37m MENU - INICIO "
msg -bar
echo -ne "\033[1;37mDigite solo el numero segun su respuesta: "
read opcao
case $opcao in
1)
msg -bar
ssl_stunel
;;
2)
msg -bar
ssl_stunel_2
sleep 3
exit
;;
3)
msg -bar
ssl_multi
;;
esac
