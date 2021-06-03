#!/bin/bash
PASS="123"
read -s -p "Password: " mypassword
echo ""
[ "$mypassword" == "$PASS" ] && VPS-ARG ; exit
exit
