#!/bin/bash
clear
nombre () {
clear 
#!/bin/bash
clear
echo  "SOLO UN CAMBIO POR ACTUALIZACIÓN"
echo -e "ESCRIBE TU NOMBRE PARA EL INICIO: "
read nombre 
echo "ENCANTADO DE CONOCERTE, $nombre"
perl -pi -e "s[A TODOS][$nombre]g" /etc/VPS-ARG/bienvenido.txt
echo  "NOMBRE ACTUALIZADO"
echo "REDIRIGIENDO AL INICIÓ"
sleep 5
VPS-ARG

mx () {
clear 
rm /etc/localtime
ln -s /usr/share/zoneinfo/America/Mexico_City /etc/localtime > /dev/null 2>&1
date "+FECHA: %D%nHORA: %T"
echo "HORA ACTULIZADA"
msg -ne "Enter Para Continuar" && read enter
VPS-ARG
}
ar () {
clear
rm /etc/localtime
ln -s /usr/share/zoneinfo/America/Buenos_Aires /etc/localtime > /dev/null 2>&1
date "+FECHA: %D%nHORA: %T"
echo "HORA ACTULIZADA"
msg -ne "Enter Para Continuar" && read enter
VPS-ARG
}
clear 
msg -bar
msg -bar3
msg -tit
echo -e "${cor[3]}         MENU PARA ACTUALIZAR NOMBRE Y HORARIOS(LA) "
msg -bar
echo -e "${cor[4]} 1).-\033[1;37m CAMBIAR NOMBRE DE INICIO "
echo -e "${cor[4]} 2).-\033[1;37m ARGENTINA, BRASIL, CHILE, URUGUAY "
echo -e "${cor[4]} 3).-\033[1;37m MÉXICO, PANAMÁ, LIMA, BOGOTÁ, ETC"
msg -bar
echo -ne     "\033[1;37mESCOJA SU OPCION: "
read opcao
case $opcao in
1)
msg -bar
nombre
;;
2)
msg -bar
ar
;;
3)
msg -bar
mx
sleep 3
exit
;;
esac
