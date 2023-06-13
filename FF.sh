#!/bin/bash

check_psiphon() {
    if dpkg -s "psiphon" >/dev/null 2>&1; then
        echo "Psiphon está instalado en el sistema."
    else
        echo "Psiphon no está instalado en el sistema."
    fi
}

check_badvpn() {
    if dpkg -s "badvpn" >/dev/null 2>&1; then
        echo "Badvpn está instalado en el sistema."
    else
        echo "Badvpn no está instalado en el sistema."
    fi
}

install_psiphon() {
    clear
    if dpkg -s "psiphon" >/dev/null 2>&1; then
        echo "Psiphon ya está instalado en el sistema."
    else
        echo "Instalando Psiphon..."
        apt-get update
        apt-get install -y psiphon
        echo "Psiphon ha sido instalado correctamente."
    fi
}

install_badvpn() {
    clear
    if dpkg -s "badvpn" >/dev/null 2>&1; then
        echo "Badvpn ya está instalado en el sistema."
        read -p "¿Desea desinstalar Badvpn? (s/n): " uninstall_choice
        if [[ $uninstall_choice == "s" || $uninstall_choice == "S" ]]; then
            uninstall_badvpn
        fi
    else
        echo "Badvpn no está instalado en el sistema."
        read -p "¿Desea instalar Badvpn? (s/n): " install_choice
        if [[ $install_choice == "s" || $install_choice == "S" ]]; then
            echo "Instalando Badvpn..."
            apt-get update
            apt-get install -y badvpn
            echo "Badvpn ha sido instalado correctamente."
        fi
    fi
}

uninstall() {
    clear
    echo "Desinstalando Psiphon..."
    apt-get purge -y psiphon
    apt-get autoremove -y
    echo "Psiphon ha sido desinstalado correctamente."
}

uninstall_badvpn() {
    clear
    echo "Desinstalando Badvpn..."
    apt-get purge -y badvpn
    apt-get autoremove -y
    echo "Badvpn ha sido desinstalado correctamente."
}

convert_json() {
    clear
    if [ -f "/root/server-entry.dat" ]; then
        echo "Convirtiendo server-entry.dat a server-entry.json..."
        cat /root/server-entry.dat | xxd -p -r | jq . > /root/server-entry.json
        echo "Archivo convertido a server-entry.json."
    else
        echo "El archivo server-entry.dat no existe."
    fi
}

view_json() {
    clear
    echo "Mostrando server-entry.json..."
    cat /root/server-entry.json
    echo
}

save_new_json() {
    clear
    read -p "Ingrese el nuevo nombre para el archivo .dat (sin extensión .dat): " new_name
    echo "Guardando nuevo archivo como $new_name.dat..."
    if [ ! -d "/root/EditPsi" ]; then
        mkdir /root/EditPsi
    fi
    echo 0 $(jq -c . < /root/server-entry.json) | xxd -ps | tr -d '\n' > /root/EditPsi/$new_name.dat
    echo "Archivo guardado como $new_name.dat."
}

view_saved_file() {
    clear
    ls /root/EditPsi
    echo "Ingrese el nombre del archivo que desea ver dentro del directorio /root/EditPsi/:"
    read file_name
    echo
    cat "/root/EditPsi/$file_name"
    echo
}

get_ports_info() {
    while true; do
        clear
        echo "Información de los puertos:"
        lsof -iTCP -sTCP:LISTEN -P -n | awk '$1 == "COMMAND" || $1 == "LISTEN" {print $1"\t"$9}'

        read -p "Ingrese el número del puerto que desea matar (presione Enter para volver al menú principal): " port_number

        if [[ -z "$port_number" ]]; then
            break
        fi

        if ! [[ "$port_number" =~ ^[0-9]+$ ]]; then
            echo "¡Opción inválida! Debe ingresar un número de puerto."
            read -p "Presione Enter para continuar..."
            continue
        fi

        echo "Matando el proceso en el puerto $port_number..."
        fuser -k "$port_number"/tcp
        echo "Proceso en el puerto $port_number eliminado."

        read -p "Presione Enter para continuar..."
    done
}

exit_handler() {
    echo "Saliendo del script..."
    exit 0
}

main_menu() {
    while true; do
        clear
        echo "==================================================="
        echo "        Lite Menú Psiphon H.C"
        echo "==================================================="
        check_psiphon
        check_badvpn
        echo "==================================================="
        echo "Menú principal:"
        echo "1. Instalar/Actualizar Psiphon"
        echo "2. Instalar/Desinstalar Badvpn"
        echo "3. Desinstalar Psiphon"
        echo "4. Convertir server-entry.dat a server-entry.json"
        echo "5. Ver server-entry.json"
        echo "6. Guardar nuevo archivo .dat"
        echo "7. Ver archivos .dat guardados"
        echo "8. Obtener información de puertos"
        echo "0. Salir"
        echo "==================================================="
        read -p "Ingrese el número de opción deseada: " option
        case $option in
            1) install_psiphon ;;
            2) install_badvpn ;;
            3) uninstall ;;
            4) convert_json ;;
            5) view_json ;;
            6) save_new_json ;;
            7) view_saved_file ;;
            8) get_ports_info ;;
            0) exit_handler ;;
            *) echo "¡Opción inválida! Por favor, ingrese un número válido." ;;
        esac
        read -p "Presione Enter para continuar..."
    done
}

# Verificar si se está ejecutando como superusuario
if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ejecutarse con privilegios de superusuario."
   exit 1
fi

# Manejador de señales
trap exit_handler SIGINT SIGTERM SIGHUP

# Ejecutar el menú principal
main_menu
