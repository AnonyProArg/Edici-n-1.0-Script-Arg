read -s -p "Password: " pp
read -s -p "Password: " con
grep $con key.txt
echo -e "\033[97mVERIFICANDO CONTRSEÑA" 
[ "$pp" == "$*" ] && echo "VALIDO"|clear ; | echo "INCORRECTO,
