#!/bin/bash

# Función de limpieza
cleanup() {
    echo "Eliminando archivo del script..."
    rm -f "$0"
    echo "Archivo del script eliminado."
}

install_dependencies() {
    echo "Instalando dependencias..."
    apt update
    apt install screen jq -y
    echo "Dependencias instaladas."
}

install_psiphon() {
    clear
    echo "Instalando Psiphon..."
    wget 'https://docs.google.com/uc?export=download&id=1Cg_YsTDt_aqK_EXbnzP9tRFSyFe_7N-m' -O 'psiphond'
    chmod 775 psiphond
    ./psiphond --ipaddress 0.0.0.0 --protocol FRONTED-MEEK-HTTP-OSSH:80 --protocol FRONTED-MEEK-OSSH:443 generate
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
    echo "Desinstalando Psiphon..."
    screen -X -S psiserver quit
    rm -f psiphond psiphond.config psiphond-traffic-rules.config psiphond-osl.config psiphond-tactics.config server-entry.dat
    echo "Psiphon desinstalado."
}

convert_json() {
    clear
    echo "Convirtiendo a .json..."
    cat /root/psi/server-entry.dat | xxd -p -r | jq . > /root/psi/server-entry.json
    echo "Archivo convertido a server-entry.json."
}

view_json() {
    clear
    echo "Mostrando server-entry.json..."
    nano /root/psi/server-entry.json
    echo
}

save_new_json() {
    clear
    read -p "Ingrese el nuevo nombre para el archivo .dat (sin extensión .dat): " new_name
    echo "Guardando nuevo archivo como $new_name.dat..."
    echo 0 $(jq -c . < /root/psi/server-entry.json) | xxd -ps | tr -d '\n' > /root/psi/$new_name.dat
    echo "Archivo guardado como $new_name.dat."
}

view_saved_file() {
    clear
    cat /root/psi/server-entry.dat
    echo
}

show_menu() {
    clear
    echo "==============================="
    echo "      Lite Menú Psiphon H.C"
    echo "==============================="
    echo "1. Instalar Servicio Psiphon (H.C)"
    echo "2. Ver archivo Hexadecimal"
    echo "3. Convertir a .json"
    echo "4. Edit archivo .json"
    echo "5. Guardar .json con nuevo nombre.dat"
    echo "6. Instalar Servicio Bad VPN 7300"
    echo "7. Desinstalar Servicio Psiphon (H.C)"
    echo "9. Salir"
    echo "==============================="
}

# Ejecutar la función de limpieza al salir
trap cleanup EXIT

# Instalar dependencias
install_dependencies

# Bucle principal
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
        9)
            echo "Saliendo del script..."
            exit 0
            ;;
        *)
            echo "Opción inválida. Por favor, selecciona una opción válida."
            ;;
    esac

    echo
done
clear
