#!/bin/bash

# Función para mostrar el título

show_title() {

    clear

    echo "*****************************"

    echo "  Instalador Psiphon  "

    echo "*****************************"

    echo

}

# Función para mostrar el menú

show_menu() {

    echo "Menú de opciones:"

    echo "1. Instalar Psiphon y ejecutar el código"

    echo "2. Instalar bad VPN 7300"

    echo "3. Mostrar configuración de Psiphon"

    echo "4. Mostrar código Psiphon en formato hexadecimal"

    echo "5. Detener servicios de Psiphon y eliminar archivos"

    echo "6. Salir"

    echo

}

# Función para esperar una opción válida

wait_for_option() {

    local valid_options="1 2 3 4 5 6"

    read -p "Ingrese una opción: " option

    while [[ ! $valid_options =~ (^|[[:space:]])$option($|[[:space:]]) ]]; do

        read -p "Opción inválida. Ingrese una opción válida: " option

    done

}

# Función para limpiar la pantalla y esperar una entrada

wait_for_enter() {

    read -p "Presione ENTER para continuar..." enter

}

# Función para instalar y ejecutar Psiphon

install_psiphon() {

    show_title

    echo "Instalando Psiphon y ejecutando código..."

    echo

    apt update

    apt install screen -y

    wget 'https://docs.google.com/uc?export=download&id=1Cg_YsTDt_aqK_EXbnzP9tRFSyFe_7N-m' -O 'psiphond'

    chmod 775 psiphond

    ./psiphond --ipaddress 0.0.0.0 --protocol FRONTED-MEEK-HTTP-OSSH:80 --protocol FRONTED-MEEK-OSSH:443 generate

    chmod 666 psiphond.config psiphond-traffic-rules.config psiphond-osl.config psiphond-tactics.config server-entry.dat

    screen -dmS psiserver ./psiphond run

    wait_for_enter

}

# Función para instalar bad VPN 7300

install_badvpn() {

    show_title

    echo "Instalando bad VPN 7300..."

    echo

    apt install badvpn -y

    badvpn-udpgw --listen-addr 127.0.0.1:7300

    wait_for_enter

}

# Función para mostrar la configuración de Psiphon

show_psiphon_config() {

    show_title

    echo "Mostrando configuración de Psiphon..."

    echo

    cat psiphond.config

    wait_for_enter

}

# Función para mostrar el código Psiphon en formato hexadecimal

show_psiphon_hex() {

    show_title

    echo "Mostrando código Psiphon en formato hexadecimal..."

    echo

    xxd psiphond

    wait_for_enter

}

# Función para detener los servicios de Psiphon y eliminar archivos

stop_and_remove_psiphon() {

    show_title

    echo "Deteniendo servicios de Psiphon y eliminando archivos..."

    echo

    screen -X -S psiserver quit

    rm -f psiphond psiphond.config psiphond-traffic-rules.config psiphond-osl.config psiphond-tactics.config server-entry.dat

    echo "Servicios de Psiphon detenidos y archivos eliminados."

    wait_for_enter

}

# Función principal para mostrar el menú y procesar las opciones

main() {

    local option

    while true; do

        show_title

        show_menu

        wait_for_option

        case $option in

            1)

                install_psiphon

                ;;

            2)

                install_badvpn

                ;;

            3)

                show_psiphon_config

                ;;

            4)

                show_psiphon_hex

                ;;

            5)

                stop_and_remove_psiphon

                ;;

            6)

                show_title

                echo "Saliendo del instalador Psiphon."

                echo

                exit 0

                ;;

        esac

    done

}

# Ejecutar la función principal

main
