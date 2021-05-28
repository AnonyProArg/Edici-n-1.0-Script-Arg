#!/bin/bash
clear
clear
rm $(pwd)/$0 &> /dev/null
#--- 20/01/2021

#------- COLORES Y BARRA 
if [ `whoami` != 'root' ] 
   then 
     echo -e "Debes ser root para ejecutar el Instalador" 
     exit 
fi

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

#------- BARRA DE ESPERA

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

updater () {
 
 if [ ! -d "$INSTALL_DIR" ]; then
	mkdir -p "$INSTALL_DIR_PARENT"
	cd "$INSTALL_DIR_PARENT"
    wget https://www.dropbox.com/s/hd9umxsjkukaqqb/zzupdate.default-si.conf -O /usr/local/vpsmxup/vpsmxup.default.conf  &> /dev/null
else
	echo ""
fi
 
 }
####------- REINICIAR UPDATER Y RECONFIGURAR HORARIO
passs(){
msg -bar
echo -e "\e[97mDIGITE UNA NUEVA CONTRASEÑA:\033[0;37m"; read -p " " pass
(echo $pass; echo $pass)|passwd root 2>/dev/null
sleep 1s
msg -bar
echo -e "\033[97m      CONTRASEÑA AGREGADA O EDITADA CORECTAMENTE"
echo -e "\033[97m SU CONTRASEÑA AHORA ES: \e[41m $pass \033[0;37m"
}

msg -bar2
echo -e " \e[97m\033[1;41m   =====>>►► 🐲 SCRIPT - VPS•MX ®️ 🐲 ◄◄<<=====     \033[1;37m"
msg -bar2
msg -ama "               PREPARANDO INSTALACION"
msg -bar2
## Script name
SCRIPT_NAME=vpsmxup
## Install directory
WORKING_DIR_ORIGINAL="$(pwd)"
INSTALL_DIR_PARENT="/usr/local/vpsmxup/"
INSTALL_DIR=${INSTALL_DIR_PARENT}${SCRIPT_NAME}/
mkdir -p "/etc/vpsmxup/" &> /dev/null
## ------ AUTO ACTULIZADOR

if [ ! -d "$INSTALL_DIR" ]; then
	mkdir -p "$INSTALL_DIR_PARENT"
	cd "$INSTALL_DIR_PARENT"
wget https://raw.githubusercontent.com/lacasitamx/VPSMX/master/zzupdate/zzupdate.default.conf -O /usr/local/vpsmxup/vpsmxup.default.conf  &> /dev/null
    #wget https://www.dropbox.com/s/p5bclg6gv74oyoy/zzupdate.default.conf -O /usr/local/vpsmxup/vpsmxup.default.conf  &> /dev/null
else
	echo ""
fi
##PAKETES
echo ""
echo -e "\033[97m    ◽️ INTENTANDO DETENER UPDATER SECUNDARIO " 
fun_bar " killall apt apt-get > /dev/null 2>&1 "
echo -e "\033[97m    ◽️ INTENTANDO RECONFIGURAR UPDATER "
fun_bar " dpkg --configure -a > /dev/null 2>&1 "
echo -e "\033[97m    ◽️ INSTALANDO S-P-C "
fun_bar " apt-get install software-properties-common -y > /dev/null 2>&1"
echo -e "\033[97m    ◽️ INSTALANDO LIBRERIA UNIVERSAL "
fun_bar " sudo apt-add-repository universe -y > /dev/null 2>&1"
echo -e "\033[97m    ◽️ INSTALANDO PYTHON "
fun_bar " sudo apt-get install python -y > /dev/null 2>&1"
apt-get install python -y &>/dev/null
echo -e "\033[97m    ◽️ INSTALANDO NET-TOOLS "
fun_bar "apt-get install net-tools -y > /dev/null 2>&1"
apt-get install net-tools -y &>/dev/null
apt-get install curl -y > /dev/null 2>&1
service ssh restart > /dev/null 2>&1

echo -e "\033[97m    ◽️ DESACTIVANDO PASS ALFANUMERICO "
sed -i 's/.*pam_cracklib.so.*/password sufficient pam_unix.so sha512 shadow nullok try_first_pass #use_authtok/' /etc/pam.d/common-password > /dev/null 2>&1 

echo -e "\033[97m    ◽️ REINICIANDO SERVICIO SSH RESTART"
fun_bar "service ssh restart > /dev/null 2>&1 "
msg -bar2
echo -e "${cor[2]} VERIFICAR POSIBLE ACTUALIZACION DE S.O (Default n)"
echo -e "\033[1;34m     (Este proceso puede demorar mucho Tiempo)"
msg -bar2
read -p "   [ s | n ]: " -e -i n updater   
[[ "$updater" = "s" || "$updater" = "S" ]] && updater
msg -bar2
echo -e "\033[93m              AGREGAR/EDITAR PASS ROOT\033[97m" 
msg -bar
read -p " default (n)  [ s | n ]: " -e -i n passs
[[ "$passs" = "s" || "$passs" = "S" ]] && passs

## VERIFICAR KEY AUTENTICA VS IP BOT
clear
cd $WORKING_DIR_ORIGINAL

SCRIPT_NAME=vpsmxup
msg -bar2
echo "         VPS-MX - $(date)"
msg -bar2
sleep 5s

## Enviroment variables
TIME_START="$(date +%s)"
DOWEEK="$(date +'%u')"
HOSTNAME="$(hostname)"

## Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT_FULLPATH=$(readlink -f "$0")
SCRIPT_HASH=`md5sum ${SCRIPT_FULLPATH} | awk '{ print $1 }'`

## Absolute path this script is in, thus /home/user/bin
SCRIPT_DIR=$(dirname "$SCRIPT_FULLPATH")/

## Config files
CONFIGFILE_NAME=$SCRIPT_NAME.conf
CONFIGFILE_FULLPATH_DEFAULT=/usr/local/vpsmxup/vpsmxup.default.conf
CONFIGFILE_FULLPATH_ETC=/etc/vpsmxup/$CONFIGFILE_NAME
CONFIGFILE_FULLPATH_DIR=${SCRIPT_DIR}$CONFIGFILE_NAME

## Title printing function
function printTitle
{
    echo ""
    echo -e "\033[1;92m$1\033[1;91m"
    printf '%0.s-' $(seq 1 ${#1})
    echo ""
}

## root check

## Profile requested
if [ ! -z "$1" ]; then

	CONFIGFILE_PROFILE_NAME=${SCRIPT_NAME}.profile.${1}.conf
	CONFIGFILE_PROFILE_FULLPATH_ETC=/etc/vpsmxup/$CONFIGFILE_PROFILE_NAME
	CONFIGFILE_PROFILE_FULLPATH_DIR=${SCRIPT_DIR}$CONFIGFILE_PROFILE_NAME

	if [ ! -f "$CONFIGFILE_PROFILE_FULLPATH_ETC" ] && [ ! -f "$CONFIGFILE_PROFILE_FULLPATH_DIR" ]; then

		echo ""
		echo "vvvvvvvvvvvvvvvvvvvv"
		echo "Catastrophic error!!"
		echo "^^^^^^^^^^^^^^^^^^^^"
		echo "Profile config file(s) not found:"
		echo "[X] $CONFIGFILE_PROFILE_FULLPATH_ETC"
		echo "[X] $CONFIGFILE_PROFILE_FULLPATH_DIR"

		printTitle "How to fix it?"
		echo "Create a config file for this profile:"
		echo "sudo cp $CONFIGFILE_FULLPATH_DEFAULT $CONFIGFILE_PROFILE_FULLPATH_ETC && sudo nano $CONFIGFILE_PROFILE_FULLPATH_ETC && sudo chmod ugo=rw /etc/vpsmxup/*.conf"

		printTitle "The End"
		echo $(date)
		msg -bar2
		exit
	fi
fi


for CONFIGFILE_FULLPATH in "$CONFIGFILE_FULLPATH_DEFAULT" "$CONFIGFILE_MYSQL_FULLPATH_ETC" "$CONFIGFILE_FULLPATH_ETC" "$CONFIGFILE_FULLPATH_DIR" "$CONFIGFILE_PROFILE_FULLPATH_ETC" "$CONFIGFILE_PROFILE_FULLPATH_DIR"
do
	if [ -f "$CONFIGFILE_FULLPATH" ]; then
		source "$CONFIGFILE_FULLPATH"
	fi
done
	
printTitle "Actualización automática"
INSTALL_DIR_PARENT="/usr/local/vpsmxup/"


SCRIPT_HASH_AFTER_UPDATE=`md5sum ${SCRIPT_FULLPATH} | awk '{ print $1 }'`
if [ "$SCRIPT_HASH" != "$SCRIPT_HASH_AFTER_UPDATE" ]; then
		echo ""
		echo "vvvvvvvvvvvvvvvvvvvvvv"
		echo "Self-update installed!"
		echo "^^^^^^^^^^^^^^^^^^^^^^"
		echo "zzupdate itself has been updated!"
		echo "Please run zzupdate again to update your system."

		printTitle "The End"
		echo $(date)
		msg -bar2
		exit
fi


if [ "$SWITCH_PROMPT_TO_NORMAL" = "1" ]; then

	printTitle "Switching to the 'normal' release channel (if 'never' or 'lts')"
	sed -i -E 's/Prompt=(never|lts)/Prompt=normal/g' "/etc/update-manager/release-upgrades"
	
else

	printTitle "La conmutación de canales está deshabilitada"
	
fi


printTitle "Limpieza de caché local"
apt-get clean

printTitle "Actualizar información de paquetes disponibles"
apt-get update

printTitle "PAQUETES DE ACTUALIZACIÓN"
apt-get dist-upgrade -y

if [ "$VERSION_UPGRADE" = "1" ] && [ "$VERSION_UPGRADE_SILENT" = "1" ]; then

	printTitle "Actualice silenciosamente a una nueva versión, si la hay"
	do-release-upgrade -f DistUpgradeViewNonInteractive
	
elif [ "$VERSION_UPGRADE" = "1" ] && [ "$VERSION_UPGRADE_SILENT" = "0" ]; then

	printTitle "Actualice interactivamente a una nueva versión, si la hay"
	do-release-upgrade
	
else

	printTitle "Nueva versión omitida (deshabilitada en la configuración)"
	
fi

if [ "$COMPOSER_UPGRADE" = "1" ]; then

	printTitle "Compositor de actualización automática"
	
	if ! [ -x "$(command -v composer)" ]; then
		echo "Composer no está instalado"
	else
		composer self-update
	fi
fi

if [ "$SYMFONY_UPGRADE" = "1" ]; then

	printTitle "Symfony con actualización automática"
	
	if ! [ -x "$(command -v symfony)" ]; then
		echo "Symfony is not installed"
	else
		symfony self:update --yes
	fi
fi

printTitle "Limpieza de paquetes (eliminación automática de paquetes no utilizados)"
apt-get autoremove -y

printTitle "Versión actual"
lsb_release -d

printTitle "Tiempo que tomó Actulizacion de Repositorios de UBUNTU"
echo "$((($(date +%s)-$TIME_START)/60)) min."
msg -bar2
echo -e "\033[93m         -- ACTULIZACION DE UBUNTU COMPLETA -- "
wget https://raw.githubusercontent.com/lacasitamx/VPSMX/master/BOT/VPS-CA -O /usr/bin/VPS-CA &> /dev/null
chmod +x /usr/bin/VPS-CA
if [ "$REBOOT" = "1" ]; then
	printTitle "        SU VPS SE REINICIARA EN 20 SEGUNDOS           "
	
	while [ $REBOOT_TIMEOUT -gt 0 ]; do
	   echo -ne "                         -$REBOOT_TIMEOUT-\033[0K\r"
	   sleep 1
	   : $((REBOOT_TIMEOUT--))
	done
	reboot
fi

printTitle "Se procede a Instalar VPS-MX"
echo $(date)
msg -bar2
sleep 7s
clear
VPS-CA
exit
