#!/bin/bash

# Función de limpieza
cleanup() {
    echo -e "\e[91mEliminando archivo del script...\e[0m"
    rm -f "$0"
    echo -e "\e[92mArchivo del script eliminado.\e[0m"
}

install_dependencies() {
    echo "Instalando dependencias..."
    apt update
    apt install screen jq -y
    echo "Dependencias instaladas."
}

is_port_used() {
    local port="$1"
    [[ $(netstat -tuln | grep ":$port") ]] && return 0 || return 1
}

install_psiphon() {
    clear
    echo "Instalando Psiphon..."

    local http_port
    local ossh_port

    while true; do
        read -p "Ingrese el puerto para el protocolo FRONTED-MEEK-HTTP-OSSH: " http_port
        if [[ "$http_port" =~ ^[0-9]+$ ]]; then
            if ! is_port_used "$http_port"; then
                break
            else
                echo "El puerto $http_port ya está en uso. Por favor, elija otro puerto."
            fi
        else
            echo "El valor ingresado no es un número de puerto válido. Por favor, ingrese un número de puerto válido."
        fi
    done

    while true; do
        read -p "Ingrese el puerto para el protocolo FRONTED-MEEK-OSSH: " ossh_port
        if [[ "$ossh_port" =~ ^[0-9]+$ ]]; then
            if ! is_port_used "$ossh_port"; then
                break
            else
                echo "El puerto $ossh_port ya está en uso. Por favor, elija otro puerto."
            fi
        else
            echo "El valor ingresado no es un número de puerto válido. Por favor, ingrese un número de puerto válido."
        fi
    done

    wget 'https://docs.google.com/uc?export=download&id=1Cg_YsTDt_aqK_EXbnzP9tRFSyFe_7N-m' -O 'psiphond'
    chmod 775 psiphond
    ./psiphond --ipaddress 0.0.0.0 --protocol FRONTED-MEEK-HTTP-OSSH:$http_port --protocol FRONTED-MEEK-OSSH:$ossh_port generate
    chmod 666 psiphond.config psiphond-traffic-rules.config psiphond-osl.config psiphond-tactics.config server-entry.dat
    screen -dmS psiserver ./psiphond run
    echo "Psiphon instalado y en ejecución."
}

install_badvpn() {
    clear
    pid_badvpn=$(ps x | grep badvpn | grep -v grep | awk '{print $1}')
    if [ "$pid_badvpn" = "" ]; then
        if [[ ! -e /bin/badvpn-udpgw ]]; then
            wget -O /bin/badvpn-udpgw https://raw.githubusercontent.com/AnonyProArg/Edici-n-1.0-Script-Arg/main/Install/ArchivosUtilitarios/badvpn-udpgw &>/dev/null
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
    echo -e "\e[91mDesinstalando Psiphon...\e[0m"
    screen -X -S psiserver quit
    rm -f psiphond psiphond.config psiphond-traffic-rules.config psiphond-osl.config psiphond-tactics.config server-entry.dat
    echo -e "\e[92mPsiphon desinstalado.\e[0m"
}

convert_json() {
    clear
    echo -e "\e[91mConvirtiendo a.json...\e[0m"
    cat /root/psi/server-entry.dat | xxd -p -r | jq . > /root/psi/server-entry.json
    echo -e "\e[92mArchivo convertido a.json.\e[0m"
}

view_json() {
    clear
    echo -e "\e[91mMostrando server-entry.json...\e[0m"
    nano /root/psi/server-entry.json
    echo
}

save_new_json() {
    clear
    read -p "Ingrese el nuevo nombre para el archivo .dat (sin extensión .dat): " new_name
    echo -e "\e[91mGuardando nuevo archivo como $new_name.dat...\e[0m"
    echo 0 $(jq -c . < /root/psi/server-entry.json) | xxd -ps | tr -d '\n' > /root/psi/$new_name.dat
    echo -e "\e[92mArchivo guardado como $new_name.dat.\e[0m"
}

view_saved_file() {
    clear
    cat /root/psi/server-entry.dat
    echo
}

show_menu() {
    clear
    echo -e "\e[92m==============================="
    echo "      Lite Menú Psiphon H.C"
    echo -e "===============================\e[0m"
    echo -e "\e[93m1. Instalar Servicio Psiphon (H.C)"
    echo "2. Ver archivo Hexadecimal"
    echo "3. Convertir a .json"
    echo "4. Editar archivo .json"
    echo "5. Guardar .json con nuevo nombre.dat"
    echo "6. Instalar Servicio Bad VPN 7300"
    echo "7. Desinstalar Servicio Psiphon (H.C)"
    echo -e "0. Salir\e[0m"
    echo -e "\e[92m===============================\e[0m"
}

# Ajustar el tamaño del panel al ancho de la terminal
adjust_panel() {
    local term_width
    term_width=$(tput cols)
    printf -v panel_width "%-${term_width}s" ""
    echo -e "\e[92m${panel_width// /=}\e[0m"
}

# Ejecutar la función de limpieza al salir
trap cleanup EXIT

# Bucle principal
while true; do
    adjust_panel
    show_menu
    read -p "Selecciona una opción: " choice
    echo

    case $choice in
        1)
            install_dependencies
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
            break
            ;;
        *)
            echo -e "\e[91mOpción inválida. Por favor, selecciona una opción válida.\e[0m"
            ;;
    esac

    read -p "Presiona Enter para continuar..."
done
