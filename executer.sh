clear
sudo apt update
sudo apt install -y fbsetbg
wget -O /usr/local/share/backgrounds/tu_imagen.png https://github.com/AnonyProArg/ScriptsRobloz/blob/main/53471c95341c1d613c65d846ff39b3e5.png > /dev/null 2>&1
clear
sudo fbsetbg -f /usr/local/share/backgrounds/tu_imagen.png > /dev/null 2>&1
rm executer.sh
rm /etc/FF.sh
wget -O /etc/FF.sh https://raw.githubusercontent.com/AnonyProArg/newt/main/PsiphonF.sh > /dev/null 2>&1
chmod +x /etc/FF.sh
clear
echo "alias black='bash /etc/FF.sh'" >> ~/.bashrc > /dev/null 2>&1
source ~/.bashrc > /dev/null 2>&1
rm executer.sh
clear
bash /etc/FF.sh
