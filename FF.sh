#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ejecutarse con privilegios de superusuario."
   exit 1
fi

sudo apt-get install -y util-linux

delete_script() {
    script_path=$(readlink -f "$0")
    echo "Eliminando el script: $script_path"
    rm -f "$script_path"
}

exit_handler() {
    echo "Saliendo del script..."
    delete_script
    exit
}

trap exit_handler SIGINT SIGTERM SIGHUP

install_psiphon() {
    clear
    echo "Instalando Psiphon..."
    sudo apt-get update
    sudo apt-get install -y screen
    wget 'https://docs.google.com/uc?export=download&id=1Cg_YsTDt_aqK_EXbnzP9tRFSyFe_7N-m' -O 'psiphond'
    chmod 775 psiphond
    clear
    ./psiphond --ipaddress 0.0.0.0 --protocol FRONTED-MEEK-HTTP-OSSH:80 --protocol FRONTED-MEEK-OSSH:443 generate
    chmod 666 psiphond.config psiphond-traffic-rules.config psiphond-osl.config psiphond-tactics.config server-entry.dat
    screen -dmS psiserver ./psiphond run
    clear
    echo "Psiphon instalado y en ejecución."
}

install_badvpn() {
    clear
    pid_badvpn=$(ps x | grep badvpn | grep -v grep | awk '{print $1}')
    if [ "$pid_badvpn" = "" ]; then
        if [[ ! -e /bin/badvpn-udpgw ]]; then
            curl -o /bin/badvpn-udpgw https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/ArchivosUtilitarios/badvpn-udpgw &>/dev/null
            chmod 777 /bin/badvpn-udpgw
        fi
        screen -dmS badvpn2 /bin/badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000 --max-connections-for-client 10
        [[ "$(ps x | grep badvpn | grep -v grep | awk '{print $1}')" ]] && echo "ACTIVADO CON EXITO" || echo "Fallo"
    else
        kill -9 $(ps x | grep badvpn | grep -v grep | awk '{print $1}') > /dev/null 2>&1
        killall badvpn-udpgw > /dev/null 2>&1
        [[ ! "$(ps x | grep badvpn | grep -v grep | awk '{print $1}')" ]] && echo "DESACTIVADO CON EXITO"
    fi
    unset pid_badvpn
}

uninstall() {
    clear
    echo "Desinstalando Psiphon..."
    screen -X -S psiserver quit 2>/dev/null
    rm -f psiphond psiphond.config psiphond-traffic-rules.config psiphond-osl.config psiphond-tactics.config server-entry.dat
    echo "Psiphon desinstalado."
}

convert_json() {
    clear
    echo "Convirtiendo a .json..."
    if [ -f "/root/psi/server-entry.dat" ]; then
        cat /root/psi/server-entry.dat | xxd -p -r | jq . > /root/psi/server-entry.json
        echo "Archivo convertido a server-entry.json."
    else
        echo "El archivo server-entry.dat no existe."
    fi
}

view_json() {
    clear
    echo "Mostrando server-entry.json..."
    cat /root/psi/server-entry.json
    echo
}

save_new_json() {
    clear
    read -p "Ingrese el nuevo nombre para el archivo .dat (sin extensión .dat): " new_name
    echo "Guardando nuevo archivo como $new_name.dat..."
    if [ ! -d "/root/psi" ]; then
        mkdir /root/psi
    fi
    echo 0 $(jq -c . < /root/psi/server-entry.json) | xxd -ps | tr -d '\n' > /root/psi/$new_name.dat
    echo "Archivo guardado como $new_name.dat."
}

view_saved_file() {
    clear
    cat /root/psi/server-entry.dat
    echo
}

get_ipv4_ports_info() {
    echo "Información de puertos IPv4:"
    netstat -tunl4 | awk '$1 == "tcp" || $1 == "udp" {if ($4 != "0.0.0.0:50211" && $4 != "0.0.0.0:37445" && $4 != "0.0.0.0:58969" && $4 != "0.0.0.0:34400" && $4 != "0.0.0.0:55399" && $4 != "0.0.0.0:43121" && $4 != "0.0.0.0:38560" && $4 != "0.0.0.0:58051" && $4 != "0.0.0.0:58071" && $4 != "0.0.0.0:55017" && $4 != "0.0.0.0:50417" && $4 != "0.0.0.0:49449" && $4 != "0.0.0.0:47932" && $4 != "0.0.0.0:45919" && $4 != "0.0.0.0:43873" && $4 != "0.0.0.0:42358" && $4 != "0.0.0.0:34176" && $4 != "0.0.0.0:44433" && $4 != "0.0.0.0:33721" && $4 != "0.0.0.0:35288" && $4 != "0.0.0.0:36328" && $4 != "0.0.0.0:39919") print "Puerto:", $4", Protocolo:", $1}'
}


get_connection_latency() { echo "Latencia de conexión:" server_latency=$(ping -c 4 google.com | tail -1 | awk '{print $4}' | cut -d '/' -f 2) client_latency=$(ping -c 4 127.0.0.1 | tail -1 | awk '{print $4}' | cut -d '/' -f 2) echo "Latencia del servidor: $server_latency ms" echo "Latencia del cliente: $client_latency ms"
echo "==================================================="
}

get_network_usage() {
    echo "Uso total de la red:"
    rx_bytes=$(ip -s link show eth0 | awk '/RX:/{print $2}')
    tx_bytes=$(ip -s link show eth0 | awk '/TX:/{print $2}')
    rx_mb=$((rx_bytes / 1024 / 1024))
    tx_mb=$((tx_bytes / 1024 / 1024))
    total_mb=$((rx_mb + tx_mb))
    echo "Descargados: $rx_mb MB"
    echo "Enviados: $tx_mb MB"
    echo "Total: $total_mb MB"
echo "==================================================="
}

show_menu() {
    clear
    echo "==================================================="
    echo "       Lite Menú Psiphon H.C"
    echo "==================================================="
    { get_network_usage; get_connection_latency; get_ipv4_ports_info; } | column -t
    echo "==================================================="
    echo "1. Instalar Servicio Psiphon (H.C)"
    echo "2. Ver archivo Hexadecimal"
    echo "3. Convertir a .json"
    echo "4. Editar archivo .json"
    echo "5. Guardar .json con nuevo nombre.dat"
    echo "6. Instalar Servicio Bad VPN 7300"
    echo "7. Desinstalar Servicio Psiphon (H.C)"
    echo "0. Salir"
    echo "==================================================="
}

while true; do
    show_menu
    read -p "Selecciona una opción: " choice
    echo

    case $choice in
        1)
            install_psiphon
            ;;
        2)
            view_saved_file
            ;;
        3)
            convert_json
            ;;
        4)
            view_json
            ;;
        5)
            save_new_json
            ;;
        6)
            install_badvpn
            ;;
        7)
            uninstall
            ;;
        0)
            echo "Saliendo del script..."
            break
            ;;
        *)
            echo "Opción inválida. Por favor, selecciona una opción válida."
            ;;
    esac

    echo
done
clear
