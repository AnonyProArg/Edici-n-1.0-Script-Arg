#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ejecutarse con privilegios de superusuario."
   exit 1
fi

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

    # Pregunta al usuario por el nuevo puerto para el protocolo FRONTED-MEEK-HTTP-OSSH
    read -p "Por favor, ingresa el puerto para el protocolo FRONTED-MEEK-HTTP-OSSH (reemplazará el puerto 80, dejar en blanco para usar el puerto predefinido): " nuevo_puerto_80

    # Si no se ingresó ningún puerto, se utiliza el puerto predefinido (80)
    if [ -z "$nuevo_puerto_80" ]; then
        nuevo_puerto_80=80
    fi

    # Pregunta al usuario por el nuevo puerto para el protocolo FRONTED-MEEK-OSSH
    read -p "Por favor, ingresa el puerto para el protocolo FRONTED-MEEK-OSSH (reemplazará el puerto 443, dejar en blanco para usar el puerto predefinido): " nuevo_puerto_443

    # Si no se ingresó ningún puerto, se utiliza el puerto predefinido (443)
    if [ -z "$nuevo_puerto_443" ]; then
        nuevo_puerto_443=443
    fi

    # Muestra los puertos seleccionados
    echo "Puerto para FRONTED-MEEK-HTTP-OSSH: $nuevo_puerto_80"
    echo "Puerto para FRONTED-MEEK-OSSH: $nuevo_puerto_443"

    # Reemplaza los puertos 80 y 443 por los nuevos puertos y muestra los textos descriptivos correspondientes
    ./psiphond --ipaddress 0.0.0.0 --protocol FRONTED-MEEK-HTTP-OSSH:$nuevo_puerto_80 --protocol FRONTED-MEEK-OSSH:$nuevo_puerto_443 generate
    chmod 666 psiphond.config psiphond-traffic-rules.config psiphond-osl.config psiphond-tactics.config server-entry.dat
    screen -dmS psiserver ./psiphond run
    clear
    echo "Psiphon instalado y en ejecución."
}

check_psiphon() {
    if [ -e /root/psi/psiphond ]; then
        echo "Psiphon: ✓ Instalado"
    else
        echo "Psiphon: x No instalado"
    fi
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

        if ps x | grep badvpn | grep -v grep | awk '{print $1}'; then
            echo "ACTIVADO CON EXITO"
        else
            echo "Fallo"
        fi

    else
        kill -9 $(ps x | grep badvpn | grep -v grep | awk '{print $1}') > /dev/null 2>&1
        killall badvpn-udpgw > /dev/null 2>&1

        if ! ps x | grep badvpn | grep -v grep | awk '{print $1}'; then
            echo "DESACTIVADO CON EXITO"
        fi
    fi

    unset pid_badvpn
}

check_badvpn() {
    if [ -e /bin/badvpn-udpgw ]; then
        echo " ✓ Instalado"
    else
        echo "Desintalado X"
    fi
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
    echo "Ingrese el nombre del archivo que desea ver dentro del directorio /root/psi/:"
    read file_name
    echo
    cat "/root/psi/$file_name"
    echo
}

get_ports_info() {
    echo "Información de los puertos:"
    netstat -tunlp | awk -F'[^0-9]+' '/:[0-9]+/ && $5 ~ /^[0-9]+$/ {
        port = $5;
        if ((port >= 0 && port <= 999 && port != 0 && port != 7300) || (port >= 1000 && port == 7300)) {
            printf "Puerto:\t\t%4s\n", port
        }
    }' | awk 'NF'
}

get_network_usage() {
    echo "Uso de red:"
    RX=$(cat /proc/net/dev | grep $(ip route show default | awk '/default/ {print $5}') | awk '{print $2}')
    TX=$(cat /proc/net/dev | grep $(ip route show default | awk '/default/ {print $5}') | awk '{print $10}')
    RX_GB=$(echo "scale=2; $RX/1024/1024/1024" | bc)
    TX_GB=$(echo "scale=2; $TX/1024/1024/1024" | bc)
    Total_GB=$(echo "scale=2; $RX_GB + $TX_GB" | bc)
    echo "Descargado: $RX_GB GB"
    echo "Subido: $TX_GB GB"
    echo "Total: $Total_GB GB"
}

main_menu() {
    while :
    do
        clear
        echo "==================================================="
        echo "       Lite Menú Psiphon H.C"
        echo "==================================================="
        get_network_usage 
        check_psiphon
        check_badvpn
        echo "==================================================="
        echo "Menú principal:"
        echo "1. Instalar Psiphon"
        echo "2. Instalar/Desinstalar Badvpn" 
        echo "--------opcionales-----------"
        echo "3. Desinstalar Psiphon"
        echo "4. Convertir a .json"
        echo "5. Ver server-entry.json"
        echo "6. Guardar nuevo archivo .dat"
        echo "7. Ver archivo hexa guardado"
        echo "8. Mostrar información de puertos activos"
        echo "0. Salir"
        echo "==================================================="
        read -p "Ingrese una opción: " option
        case $option in
            1)
                install_psiphon
                ;;
            2)
                install_badvpn
                ;;
            3)
                uninstall
                ;;
            4)
                convert_json
                ;;
            5)
                view_json
                ;;
            6)
                save_new_json
                ;;
            7)
                view_saved_file
                ;;
            8)
                get_ports_info
                ;;
            0)
                exit_handler
                ;;
            *)
                echo "Opción inválida. Intente nuevamente."
                ;;
        esac
        read -p "Presione Enter para continuar..."
    done
}

main_menu
