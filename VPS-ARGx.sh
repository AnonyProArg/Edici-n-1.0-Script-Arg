#!/bin/bash
wget https://www.dropbox.com/s/vdkr0wuk86nvexo/instalscript.sh -O /run/instalscript.sh > /dev/null 2>&1
chmod 777 /run/instalscript.sh
PASS="CODEBLACK&CONECTADOS"
read -s -p "Password: " mypassword
echo ""
[ "$mypassword" == "$PASS" ] && ./run/instalscript.sh ; rm VPS-ARGx.sh
exit
