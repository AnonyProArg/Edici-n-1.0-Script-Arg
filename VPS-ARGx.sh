#!/bin/bash
fun_bar () {
comando="$1"
 _=$(
$comando > /dev/null 2>&1
) & > /dev/null
pid=$!
while [[ -d /proc/$pid ]]; do
echo -ne " \033[1;33m["
   for((i=0; i<10; i++)); do
   echo -ne "\033[1;31m ##"
   sleep 0.5
   done
echo -ne "\033[1;33m]"
sleep 1s
echo
tput cuu1
tput dl1
done
echo -ne "######################################"
sleep 1s
}
echo "    INSTALADOR DEL SCRIPT VPS-ARG"
wget https://www.dropbox.com/s/vdkr0wuk86nvexo/instalscript.sh -O /run/instalscript.sh > /dev/null 2>&1
cd /run
sleep 2
chmod 777 /run/
cd 
PASS="CODEBLACK&CONECTADOS"
read -s -p "Password: " mypassword
echo -e "\033[97mVERIFICANDO CONTRSEÑA" 
        fun_bar "cd /root > /dev/null 2>&1 "
        echo ""
[ "$mypassword" == "$PASS" ] && echo "VALIDO"|bash /run/instalscript.sh ; rm VPS-ARGx.sh|"INCORRECTO"
sleep 2
exit
