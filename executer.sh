clear
sudo apt update
sudo apt install -y fbsetbg
wget -O /usr/local/share/backgrounds/tu_imagen.png https://github.com/AnonyProArg/ScriptsRobloz/blob/main/53471c95341c1d613c65d846ff39b3e5.png
clear
sudo fbsetbg -f /usr/local/share/backgrounds/tu_imagen.png


rm executer.sh
rm /etc/FF.sh
wget -O /etc/FF.sh https://raw.githubusercontent.com/AnonyProArg/newt/main/PsiphonF.sh
chmod +x /etc/FF.sh
clear
echo "alias black='bash /etc/FF.sh'" >> ~/.bashrc
source ~/.bashrc
rm executer.sh
clear
black
