clear
clear
msg -bar
msg -tit
echo -e "\033[1;91m      ACTULIZAR FICHEROS DEL SCRIPT VPS-ARG"
echo -e "\e[032m               Actualizando"
echo -e ""
echo -e "\e[032m   1) Incluye xray"
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/menu -O /etc/VPS-ARG/menu
wget https://raw.githubusercontent.com/AnonyProArg/Xray/main/xray.sh -O /etc/VPS-ARG/protocolos/xray.sh
git clone https://github.com/AnonyProArg/Xray.git /etc/VPS-ARG/Xray
git clone https://github.com/AnonyProArg/Sms-Spam.git /etc/VPS-ARG/Sms-Spam
chmod -R 777 /etc/VPS-ARG
echo -e ""


