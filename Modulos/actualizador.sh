clear
clear
msg -bar
msg -tit
echo -e "\033[1;91m      ACTULIZAR FICHEROS DEL SCRIPT VPS-ARG"
echo -e "\e[032m               Actualizando"
echo -e ""
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/menu -O /etc/VPS-ARG/menu
wget https://raw.githubusercontent.com/AnonyProArg/Xray/main/xray.sh -O /etc/VPS-ARG/protocolos/xray.sh
git clone https://github.com/AnonyProArg/Xray.git /etc/VPS-ARG/Xray
git clone https://github.com/AnonyProArg/Sms-Spam.git /etc/VPS-ARG/Sms-Spam
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/Version -O /etc/versin_script
wget https://raw.githubusercontent.com/AnonyProArg/Sms-Spam/main/SMS.sh -O /etc/VPS-ARG/herramientas/SMS.sh
wget https://raw.githubusercontent.com/AnonyProArg/Sms-Spam/main/.notify -O /etc/VPS-ARG/Sms-Spam/.notify
chmod -R 777 /etc/VPS-ARG
clear
clear
clear
clear
clear
clear 
clear
echo -e "\e[032m                   ACTUALIZACION COPLETA"
echo -e "\e[032m               Correcion de errores y bug"
msg -ne "Enter Para Continuar" && read enter
VPS-ARG
