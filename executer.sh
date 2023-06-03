clear
rm executer.sh
rm /etc/FF.sh
wget -O /etc/FF.sh https://raw.githubusercontent.com/AnonyProArg/newt/main/FF.sh
chmod +x /etc/FF.sh
clear
echo "alias black='bash /etc/FF.sh'" >> ~/.bashrc
source ~/.bashrc
rm executer.sh
clear
black
