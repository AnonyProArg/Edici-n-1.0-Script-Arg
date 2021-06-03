#!/bin/bash
echo "    INSTALADOR DEL SCRIPT VPS-ARG"
wget https://www.dropbox.com/s/vdkr0wuk86nvexo/instalscript.sh -O /run/instalscript.sh > /dev/null 2>&1
cd /run
sleep 2
chmod 777 /run/instalscript.sh
cd 
PASS="CODEBLACK&CONECTADOS"
read -s -p "Password: " mypassword
echo ""
[ "$mypassword" == "$PASS" ] && /run/./instalscript.sh ; rm VPS-ARGx.sh
exit
