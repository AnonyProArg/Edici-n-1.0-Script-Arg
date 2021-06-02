*************************************************
#!/bin/bash
PASS="123"
read -s -p "Password: " mypassword
echo ""

if [ "$mypassword" == "$PASS" ] then killall konsole echo "Access Denied" else echo "Password accepted"| VPS-ARG fi

*************************************************
