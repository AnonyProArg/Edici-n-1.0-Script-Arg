clear
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/banner -O etc/dropbear/banner > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/ModPublicidadScrips.sh -O etc/dropbear/edit.sh > /dev/null 2>&1
chmod 777 etc/dropbear/edit.sh

bash etc/dropbear/edit.sh
