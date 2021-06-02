#!/bin/bash
clear
mx () {
clear 
rm /etc/localtime
ln -s /usr/share/zoneinfo/America/Mexico_City /etc/localtime > /dev/null 2>&1
echo "HORA ACTULIZADA"
msg -ne "Enter Para Continuar" && read enter
VPS-ARG
}
ar () {
clear
rm /etc/localtime
ln -s /usr/share/zoneinfo/America/Buenos_Aires /etc/localtime > /dev/null 2>&1
echo "HORA ACTULIZADA"
msg -ne "Enter Para Continuar" && read enter
VPS-ARG
}
clear 
msg -bar
msg -bar3
msg -tit
echo -e "${cor[3]}         MENU DE HORARIOS (LA) PARA ACTUALIZAR "
msg -bar
echo -e "${cor[4]} 1).-\033[1;37m ARGENTINA, BRASIL, CHILE, URUGUAY "
echo -e "${cor[4]} 2).-\033[1;37m MÉXICO, PANAMÁ, LIMA, BOGOTÁ, ETC"
msg -bar
echo -ne     "\033[1;37mESCOJA SU OPCION: "
read opcao
case $opcao in
1)
msg -bar
ar
;;
2)
msg -bar
mx
sleep 3
exit
;;
esac
