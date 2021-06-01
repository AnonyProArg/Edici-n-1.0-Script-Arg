clear
fi
NEGRITO='\e[1m'
SEMCOR='\e[0m'
 case $1 in
  -ne)cor="${COLOR[1]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -ama)cor="${COLOR[3]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verm)cor="${COLOR[3]}${NEGRITO}[!] ${COLOR[1]}" && echo -e "${cor}${2}${SEMCOR}";;
  -verm2)cor="${COLOR[1]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -azu)cor="${COLOR[6]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verd)cor="${COLOR[2]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -bra)cor="${COLOR[0]}${SEMCOR}" && echo -e "${cor}${2}${SEMCOR}";;
  "-bar2"|"-bar")cor="${COLOR[1]}———————————————————————————————————————————————————————————————" && echo -e "${SEMCOR}${cor}${SEMCOR}";;
  -tit)echo -e "\e[97m \033[1;41m|...SCRIPT (>‿◠)✌ VPS-ARG...| \033[1;49m\033[1;49m \033[1;31m[ \033[1;32m $vesaoSCT " && echo -e "${SEMCOR}${cor}${SEMCOR}";;
  -bar3) $([[ ! -e $(echo -e $(echo "2f7573722f73686172652f6d65646961707472652f6c6f63616c2f6c6f672f6c6f676e756c6c"| sed 's/../\\x&/g;s/$/ /')) ]] && $( aviso_bock > /dev/null 2>&1)) && echo -e "${SEMCOR}${cor}${SEMCOR}";;
msg -bar2
msg -tit
msg -ama "               MENU DE ACTUALIZACIONES "
msg -bar2
echo ""
echo -ne "\e[93m  [1]" msg -bra "\033[1;31m DIARIO DEL CREADOR  " 
echo ""
echo -ne "\e[93m  [2]" msg -bra  "\033[1;41m ACTUALIZAR SCRIPT "
echo ee
echo -ne "\e[93m  [2]" msg -bra  "\033[1;41m MENU "
selection=$(selection_fun 13)
case ${selection} in
1)diario ;;
2)atualiza_fun ;;
0)cd $HOME && exit 0;;
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
echo -ne   " \033[1;33m[\033[1;31mtu->(　-_･) ︻デ═一 ▸▸ ▸▸▸▸ ▸▸▸ ▸▸▸▸ ▸▸▸▸ ▸▸▸▸ ▸▸▸(x_x)<-tu ex \033[1;33m] - \033[1;32m OK \033[0m\n"
sleep 1s
}
diario () {
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/diario.sh -O /etc/VPS-ARG/diario.sh > /dev/null 2>&1 
chmod -R 777 /etc/VPS-ARG
bash /etc/VPS-ARG/diario.sh
}
atualiza_fun () {
##PAKETES
echo ""
echo -e "\033[97m     EXAMINANDO LINKS Y DIRECTORIOS POR ACTUALIZAR" 
        fun_bar "wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/menu -O /etc/VPS-ARG/menu > /dev/null 2>&1 "
echo -e "\033[97m        DESCARGANDO PAQUETES ACTUALIZADOS" 
        fun_bar "wget https://raw.githubusercontent.com/AnonyProArg/Xray/main/xray.sh -O /etc/VPS-ARG/protocolos/xray.sh > /dev/null 2>&1 "
echo -e "\033[97m      BORRANDO ARCHIVOS OBSOLETOS" 
        fun_bar "wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/ssl.sh -O /etc/VPS-ARG/protocolos/ssl.sh > /dev/null 2>&1 "
git clone https://github.com/AnonyProArg/Xray.git /etc/VPS-ARG/Xray > /dev/null 2>&1
git clone https://github.com/AnonyProArg/Sms-Spam.git /etc/VPS-ARG/Sms-Spam > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/Version -O /etc/versin_script > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Sms-Spam/main/SMS.sh -O /etc/VPS-ARG/herramientas/SMS.sh > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Sms-Spam/main/.notify -O /etc/VPS-ARG/Sms-Spam/.notify > /dev/null 2>&1
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/InfoDiario.sh -O /etc/VPS-ARG/ > /dev/null 2>&1
chmod -R 777 /etc/VPS-ARG
find . -iname 'wget-log*' -delete
find . -iname 'instalscript.sh*' -delete
echo -e "\e[032m                   ACTUALIZACION COMPLETA"
echo -e "\e[032m               Correccion de errores y bugs"
msg -ne "Enter Para Continuar" && read enter
VPS-ARG
