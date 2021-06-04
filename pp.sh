read -s -p "Password: " pp
grep $* key.txt
echo -e "\033[97mVERIFICANDO CONTRSEÑA" 
[ "$mypassword" == "$*" ] && echo "VALIDO"|clear ; | echo "INCORRECTO,
