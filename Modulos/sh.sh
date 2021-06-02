#!/bin/bash
PASS="123"
read -s -p "Password: " mypassword
echo ""
[ "$mypassword" == "$PASS" ] && echo "CONTRASEÑA CORRECTA"| sudo VPS-ARG |
exit
