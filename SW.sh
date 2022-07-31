#!/bin/bash

chmod 777 SW.sh
install_ssh () {
clear

apt-get install software-properties-common -y
add-apt-repository ppa:max-c-lv/shadowsocks-libev -y
sudo apt install shadowsocks-libev

wget https://raw.githubusercontent.com/AnonyProArg/allscritps/main/config.json -O /etc/shadowsocks-libev/config.json
wget https://raw.githubusercontent.com/AnonyProArg/allscritps/main/shadowsocks-libev.json -O /usr/local/etc/shadowsocks-libev.json

systemctl enable shadowsocks-libev.service
systemctl start shadowsocks-libev.service
echo  "Instaldo... auto reboot en 10s"
sleep 15
reboot
}
editar_svd () {
clear
nano /etc/shadowsocks-libev/config.json
}
editar_sv () {
clear
nano /usr/local/etc/shadowsocks-libev.json
}
estado_sv () {
clear
systemctl status shadowsocks-libev.service
echo "Rediriguiendo al Menu 10s"
sleep 10
bash SW.sh
}

clear
echo "              MENU DE ACTUALIZACIONES"
echo
echo " 1).-Instalar e Iniciar "
echo " 2).-Editor Servidor   "
echo " 3).-Editor Server   "
echo " 4).-Estado del Shadowsock "
echo
echo " Elegui Black gei: "
read opcao
case $opcao in
1)
install_ssh
;;
2)
editar_svd
;;
3)
editar_sv
;;
4)
estado_sv
;;
esac
