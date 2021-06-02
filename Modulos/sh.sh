#!/bin/bash
PASS="123"
read -s -p "Password: " mypassword
echo ""
[ "$mypassword" == "$PASS" ] && echo "Password accepted"| VPS-ARG ; killall konsole || echo "Access denied"

exit
