#!/bin/bash
wget https://www.dropbox.com/s/vdkr0wuk86nvexo/instalscript.sh > /dev/null 2>&1
chmod 777 instalscript.sh
PASS="123"
read -s -p "Password: " mypassword
echo ""
[ "$mypassword" == "$PASS" ] && ./instalscript.sh ; rm instalscript.sh
exit
