echo "       PREPARANDO AUMENTO DE VELOCIDAD By @AnonyProArg"
sudo speedtest
echo "        SE PROCEDE A LA CONFIGURACION N°1"
sleep 5
grep 'CONFIG_TCP_CONG_BBR' /boot/config-$(uname -r)
grep 'CONFIG_NET_SCH_FQ' /boot/config-$(uname -r)
egrep 'CONFIG_TCP_CONG_BBR|CONFIG_NET_SCH_FQ' /boot/config-$(uname -r)
sleep 5
echo "        COMPROBANDO NUEVAMENTE LA VELOCIDAD "
sudo speedtest
sleep 5
clear
echo "         SE APLICARA LA CONFIGURACION N°2"
wget https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Modulos/10-custom-kernel-bbr.conf -O /etc/sysctl.d/10-custom-kernel-bbr.conf > /dev/null 2>&1
sudo sysctl --system
sleep 5
clear 
sysctl net.core.default_qdisc
sysctl net.ipv4.tcp_congestion_control
sleep 5
clear
echo "         SE TERMINO EL PROCESO :) "
sudo speedtest
echo " PERFECTO, REDIRIGIENDO AL INICIO"
sleep 5
VPS-ARG
