#!/bin/bash
clear
cd $HOME
systemedia &> /dev/null
rm $(pwd)/$0 &> /dev/null
SCPdir="/etc/VPS-ARG"
SCPinstal="$HOME/install"
SCPidioma="${SCPdir}/idioma"
SCPusr="${SCPdir}/controlador"
SCPfrm="${SCPdir}/herramientas"
SCPinst="${SCPdir}/protocolos"
kalix1="aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0FBQUFBRVhRT1N5SXBOMkpaMGVoVVEvVlBTLU1YL21haW4vTW9kdWxvcw=="
PUTO='base64 -d'
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
service apache2 restart > /dev/null 2>&1
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;
mkdir -p /etc/B-ADMuser &>/dev/null
rm -rf /etc/localtime &>/dev/null
ln -s /usr/share/zoneinfo/America/Mexico_City /etc/localtime &>/dev/null
rm $(pwd)/$0 &> /dev/null
rm -rf /usr/local/lib/systemubu1 &> /dev/null
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
### PAQUETES PRINCIPALES 
msg -bar2
msg -ama "     [ VPS - ARG - SCRIPT \033[1;97m By AnonyProArg 🇦🇷\033[1;33m ]"
msg -bar
echo -e "\033[97m"
echo -e "  \033[41m    --♕  ł₦₴₮₳Ⱡ₳₵łØ₦ ĐɆ ₱₳QɄɆ₮Ɇ₴ ₱₳Ɽ₳ V₱₴-₳Ɽ₲ ♕ --    \e[49m"
echo -e "  \033[100m    INSTALACION AUTOMATICA(RELAJATE Y DISFRUTA)    "
echo -e "\033[97m"
msg -bar

#grep
apt-get install grep -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "grep"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "grep"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install grep............ $ESTATUS "
#gawk
apt-get install gawk -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "gawk"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "gawk"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install gawk............ $ESTATUS "
#mlocate
apt-get install mlocate -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "mlocate"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "mlocate"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install mlocate......... $ESTATUS "
#lolcat gem
apt-get install lolcat -y &>/dev/null
sudo gem install lolcat &>/dev/null
[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install lolcat.......... $ESTATUS "
#at
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] || apt-get install at -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install at.............. $ESTATUS "
#nano
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] || apt-get install nano -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install nano............ $ESTATUS "
#bc
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || apt-get install bc -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
systemedia &> /dev/null
echo -e "\033[97m    # apt-get install bc.............. $ESTATUS "
#lsof
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] || apt-get install lsof -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install lsof............ $ESTATUS "
#figlet
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || apt-get install figlet -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install figlet.......... $ESTATUS "
#cowsay
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] || apt-get install cowsay -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install cowsay.......... $ESTATUS "
#screen
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] || apt-get install screen -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install screen.......... $ESTATUS "
#python
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] || apt-get install python -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install python.......... $ESTATUS "
#python3
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] || apt-get install python3 -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install python3......... $ESTATUS "
#python3-pip
[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] || apt-get install python3-pip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install python3-pip..... $ESTATUS "
#ufw
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] || apt-get install ufw -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install ufw............. $ESTATUS "
#unzip
[[ $(dpkg --get-selections|grep -w "unzip"|head -1) ]] || apt-get install unzip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "unzip"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "unzip"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install unzip........... $ESTATUS "
#zip
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] || apt-get install zip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install zip............. $ESTATUS "
#apache2
apt-get install apache2 -y &>/dev/null
sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf > /dev/null 2>&1
service apache2 restart > /dev/null 2>&1 
# [[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || {
 # apt-get install apache2 -y &>/dev/null
 # sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
 # service apache2 restart > /dev/null 2>&1 &
 # }
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install apache2......... $ESTATUS "
msg -bar2

read -t 20 -n 1 -rsp $'\033[1;39m Preciona Enter Para continuar\n'
clear
### FIXEADOR PARA SISTEMAS 86_64
idfix64_86 () {
clear
clear
msg -bar2
msg -ama "     [ VPS - ARG - SCRIPT \033[1;97m By AnonyProArg\033[1;33m ]"
msg -bar2
echo ""
echo -e "\e[91m   INSTALACION SEMI MANUAL DE PAQUETES "
echo -e "\e[91m(En caso de pedir confirmacion escoja: #y#) \e[0m"
echo ""
sleep 7s
apt-get update; apt-get upgrade -y
apt-get install curl -y
apt-get install lsof -y
apt-get install sudo -y
apt-get install figlet -y
apt-get install cowsay -y
apt-get install bc -y
apt-get install python -y
apt-get install at -y
apt-get install apache2 -y
sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
service apache2 restart
clear
clear
clear
msg -bar2
msg -ama "     [ VPS - ARG - SCRIPT \033[1;97m  By AnonyProArg🇦🇷\033[1;33m ]"
msg -bar2
echo ""
echo -e "\e[91mESCOJER PRIMERO #All locales# Y LUEGO #en_US.UTF-8# \e[0m" 
echo ""
sleep 7s
 export LANGUAGE=en_US.UTF-8\
   && export LANG=en_US.UTF-8\
   && export LC_ALL=en_US.UTF-8\
   && export LC_CTYPE="en_US.UTF-8"\
   && locale-gen en_US.UTF-8\
   && sudo apt-get -y install language-pack-en-base\
   && sudo dpkg-reconfigure locales
clear
}
clear
clear
msg -bar2
msg -ama "     [ VPS - ARG - SCRIPT \033[1;97m By AnonyProArg 🇦🇷\033[1;33m ]"
msg -bar2
echo -e "\033[1;97m  ¿PRESENTO ALGUN ERROR LA INSTALACION ANTERIOR?" 
msg -bar2
echo -e "\033[1;32m 1- Escoja:(N) No. Para Instalacion Normal"
echo -e "\033[1;31m 2- Escoja:(S) Si. Saltaron errores."
msg -bar2
echo -e "\033[1;39m Presiona enter para continuar la instalacion Normal"
msg -bar2
## read -p " [ S | N ]: " idfix64_86 
read -p " default (n)  [ s | n ]: " -e -i n idfix64_86  
[[ "$idfix64_86" = "s" || "$idfix64_86" = "S" ]] && idfix64_86
clear
fun_ip () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ifconfig.me)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}  
function_verify () {
wget -O /usr/bin/trans https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/ArchivosUtilitarios/trans &> /dev/null
wget -O /etc/versin_script https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/Version &> /dev/null
wget -O /usr/bin/SPR https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/ArchivosUtilitarios/SPR/SPR &> /dev/null
chmod +x /usr/bin/SPR
## lognull
mkdir /usr/share/mediaptre &>/dev/null
mkdir /usr/share/mediaptre/local &>/dev/null
mkdir /usr/share/mediaptre/local/log &>/dev/null
[[ ! -e /usr/share/mediaptre/local/log/lognull ]] && touch /usr/share/mediaptre/local/log/lognull
echo "@Kali1-KEY DELETE LOG" > /usr/share/mediaptre/local/log/lognull && chmod +x /usr/share/mediaptre/local/log/lognull
## systemubu1
[[ ! -e /usr/local/lib/systemubu1 ]] && touch /usr/local/lib/systemubu1
## systemubu1
mkdir /usr/local/lib/system &>/dev/null
mkdir /usr/local/lib/system/ubuntu &>/dev/null
[[ ! -e /usr/local/lib/system/ubuntu/systemubu1 ]] && touch /usr/local/lib/system/ubuntu/systemubu1
echo "@Kali1-KEY DELETE LOG" > /usr/local/lib/system/ubuntu/systemubu1 && chmod +x /usr/local/lib/system/ubuntu/systemubu1
## lsystembin2
[[ ! -e /usr/local/lib/lsystembin2 ]] && touch /usr/local/lib/lsystembin2
## ver
mkdir /usr/local/lib/ubuntn &>/dev/null
mkdir /usr/local/lib/ubuntn/apache &>/dev/null
[[ ! -d /usr/local/lib/ubuntn/apache/ver ]] && mkdir /usr/local/lib/ubuntn/apache/ver
## apachsys
mkdir /usr/local/lib/apachsys &>/dev/null
echo "@Kali1-KEY DELETE LOG" > /usr/local/lib/apachsys/filessys && chmod +x /usr/local/lib/apachsys/filessys
mkdir /usr/local/lib/apachsys/sytemslkd &>/dev/null
}
funcao_idioma () {
clear
clear
msg -bar2
figlet "    -VPS ARG-" | lolcat 
echo -e "     (っ◔◡◔)っ ♥ ESTE SCRIPT ESTA OPTIMIZADO A IDIOMA ESPAÑOL ♥"
msg -bar2
pv="$(echo es)"
[[ ${#id} -gt 2 ]] && id="es" || id="$pv"
byinst="true"
}
reboot_fun () {
	msg -bar2
	echo -e "\033[92m       ❗️ SU VPS SE REINICIARA EN 5 SEGUNDOS ❗️            "
	msg -bar2
	sleep 5s
	reboot
	exit
}
install_fim () {
clear
clear
msg -bar2
msg -ama "               Finalizando Instalacion" && msg bar2
#rm -rf /etc/VPS-ARG/controlador/nombre.log &>/dev/null
[[ $(find /etc/VPS-ARG/controlador -name nombre.log|grep -w "nombre.log"|head -1) ]] || wget -O /etc/VPS-ARG/controlador/nombre.log https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/ArchivosUtilitarios/nombre.log &>/dev/null
[[ $(find /etc/VPS-ARG/controlador -name IDT.log|grep -w "IDT.log"|head -1) ]] || wget -O /etc/VPS-ARG/controlador/IDT.log https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/ArchivosUtilitarios/IDT.log &>/dev/null
[[ $(find /etc/VPS-ARG/controlador -name tiemlim.log|grep -w "tiemlim.log"|head -1) ]] || wget -O /etc/VPS-ARG/controlador/tiemlim.log https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/ArchivosUtilitarios/tiemlim.log &>/dev/null

wget -O /bin/rebootnb https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/ArchivosUtilitarios/rebootnb &> /dev/null
chmod +x /bin/rebootnb 
wget -O /bin/resetsshdrop https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/ArchivosUtilitarios/resetsshdrop &> /dev/null
chmod +x /bin/resetsshdrop
wget -O /etc/versin_script_new https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/Version &>/dev/null
msg -bar2
echo '#!/bin/sh -e' > /etc/rc.local
sudo chmod +x /etc/rc.local
echo "sudo rebootnb" >> /etc/rc.local
echo "sudo resetsshdrop" >> /etc/rc.local
echo "sleep 2s" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
/bin/cp /etc/skel/.bashrc ~/
echo 'clear' >> .bashrc
echo 'echo ""' >> .bashrc
echo 'echo -e "\t\033[91m ██╗░░░██╗██████╗░░██████╗  ░█████╗░██████╗░░██████╗ " '>> .bashrc
echo 'echo -e "\t\033[91m ██║░░░██║██╔══██╗██╔════╝ ██╔══██╗██╔══██╗██╔════╝" '>> .bashrc
echo 'echo -e "\t\033[91m ╚██╗░██╔╝██████╔╝╚█████╗░ ███████║██████╔╝██║░░██╗" '>> .bashrc
echo 'echo -e "\t\033[91m ░╚████╔╝░██╔═══╝░░╚═══██╗|██╔══██║██╔══██╗██║░░╚██╗" '>> .bashrc
echo 'echo -e "\t\033[91m  ░╚██╔╝░░██║░░░░░██████╔╝ ██║░░██║██║░░██║╚██████╔╝" '>> .bashrc
echo 'echo "" '>> .bashrc
echo 'mess1="$(less /etc/VPS-ARG/message.txt)" ' >> .bashrc
echo 'echo "" '>> .bashrc
echo 'echo -e "\t\033[92mRESELLER : $mess1 "'>> .bashrc
echo 'echo "" '>> .bashrc                                               
echo 'echo -e "\t\033[97mPARA MOSTAR PANEL BASH ESCRIBA: VPS-ARG  "'>> .bashrc
echo 'wget -O /etc/versin_script_new https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/Version &>/dev/null'>> .bashrc
echo 'echo ""'>> .bashrc
echo -e "         COMANDO PRINCIPAL PARA ENTRAR AL PANEL "
echo -e "  \033[1;45m                VPS-ARG             \033[0;37m" && msg -bar2
echo -e " ACTUALIZACION AUTOMATICA (OBLIGATORIA) EN 5s.."
sleep 5
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/actualizador.sh -O /etc/VPS-ARG/actualizador.sh &>/dev/null
chmod 777 actualizador.sh
bash actualizador.sh
