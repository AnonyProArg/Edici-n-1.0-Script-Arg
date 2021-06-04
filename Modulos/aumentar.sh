echo "       PREPARANDO AUMENTO DE VELOCIDAD By @AnonyProArg"
sudo speedtest
echo "        SE PROCEDE A LA CONFIGURACION N°1"
sleep 2
grep 'CONFIG_TCP_CONG_BBR' /boot/config-$(uname -r)
grep 'CONFIG_NET_SCH_FQ' /boot/config-$(uname -r)
egrep 'CONFIG_TCP_CONG_BBR|CONFIG_NET_SCH_FQ' /boot/config-$(uname -r)
sleep 2
echo "        COMPROBANDO NUEVAMENTE LA VELOCIDAD "
sudo speedtest
sleep 2
clear
echo "         SE APLICARA LA CONFIGURACION N°2"
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/10-custom-kernel-bbr.conf -O /etc/sysctl.d/10-custom-kernel-bbr.conf
udo sysctl --system
sleep 3
clear 
sysctl net.core.default_qdisc
sysctl net.ipv4.tcp_congestion_control
sleep 1
clear
echo "         SE TERMINO EL PROCESO :) "
sudo speedtest
echo " PERFECTO, REDIRIGIENDO AL INICIO"
sleep 3
VPS-ARG
