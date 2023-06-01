#!/bin/bash

# Función para mostrar el título

show_title() {

    clear

    echo "*****************************"

    echo "  Instalador Psiphon  "

    echo "*****************************"

    echo

}

# Función para esperar una opción válida

wait_for_option() {

    local valid_options="1 2 3 4 5 6 7 8 9"

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

    echo "Archivos disponibles en el directorio:"

    ls /root/psi

    echo ""

    read -p "Ingrese el nombre del archivo que desea mostrar: " archivo_mostrar

    if [ -f "/root/psi/$archivo_mostrar" ]; then

        echo "Mostrando contenido del archivo..."

        echo

        cat "/root/psi/$archivo_mostrar"

    else

        echo "El archivo especificado no existe."

    fi

    wait_for_enter

}

# Función para mostrar el código Psiphon en formato hexadecimal

show_psiphon_hex() {

    show_title

    echo "Archivos disponibles en el directorio:"

    ls /root/psi

    echo ""

    read -p "Ingrese el nombre del archivo que desea mostrar en formato hexadecimal: " archivo_mostrar

    if [ -f "/root/psi/$archivo_mostrar" ]; then

        echo "Mostrando contenido del archivo en formato hexadecimal..."

        echo

        xxd -p "/root/psi/$archivo_mostrar"

    else

        echo "El archivo especificado no existe."

    fi

    wait_for_enter

}

# Función para detener los servicios de Psiphon y eliminar archivos

stop_and_remove_psiphon() {

    show_title

    echo "Deteniendo servicios de Psiphon..."

    echo

    pkill psiphond

    rm -f psiphond psiphond.config psiphond-traffic-rules.config psiphond-osl.config psiphond-tactics.config server-entry.dat

    echo "Servicios de Psiphon detenidos y archivos eliminados."

    wait_for_enter

}

# Función para convertir, editar y guardar un archivo

convertir_editar_guardar() {

    show_title

    echo "Archivos disponibles en el directorio:"

    ls /root/psi

    echo ""

    read -p "Ingrese el nombre del archivo que desea convertir, editar y guardar: " archivo_convertir

    if [ -f "/root/psi/$archivo_convertir" ]; then

        cat "/root/psi/$archivo_convertir" | xxd -p -r | jq . > /root/psi/server-entry.json

        nano /root/psi/server-entry.json

        read -p "Ingrese el nuevo nombre para el archivo: " nuevo_nombre

        echo "Guardando archivo..."

        echo 0 $(jq -c . < /root/psi/server-entry.json) | xxd -ps | tr -d '\n' > "/root/psi/$nuevo_nombre.dat"

        echo "Archivo guardado con el nuevo nombre."

        mostrar_archivo "$nuevo_nombre.dat"

    else

        echo "El archivo especificado no existe."

    fi

    wait_for_enter

}

# Función para mostrar el contenido de un archivo

mostrar_archivo() {

    cat "/root/psi/$1"

    echo ''

}

# Función para cambiar el nombre de un archivo

cambiar_nombre_archivo() {

    clear

    echo "Archivos disponibles en el directorio:"

    ls /root/psi

    echo ""

    read -p "Ingrese el nombre del archivo que desea cambiar: " archivo_actual

    if [ -f "/root/psi/$archivo_actual" ]; then

        read -p "Ingrese el nuevo nombre para el archivo: " nuevo_nombre

        mv "/root/psi/$archivo_actual" "/root/psi/$nuevo_nombre"

        echo "Nombre del archivo cambiado exitosamente."

    else

        echo "El archivo especificado no existe."

    fi

    wait_for_enter

}

# Función para mostrar el menú de opciones

mostrar_menu() {

    clear

    echo "=== Menú ==="

    echo "1. Instalar Psiphon y ejecutar el código"

    echo "2. Instalar bad VPN 7300"

    echo "3. Mostrar configuración de Psiphon"

    echo "4. Mostrar código Psiphon en formato hexadecimal"

    echo "5. Detener servicios de Psiphon y eliminar archivos"

    echo "6. Convertir, editar y guardar archivo"

    echo "7. Mostrar archivo"

    echo "8. Cambiar nombre del archivo"

    echo "9. Salir"

    echo "========================"

}

# Función principal para mostrar el menú y procesar las opciones

ejecutar() {

    local option

    while true; do

        mostrar_menu

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

                convertir_editar_guardar

                ;;

            7)

                show_title

                echo "Archivos disponibles en el directorio:"

                ls /root/psi

                echo ""

                read -p "Ingrese el nombre del archivo que desea mostrar: " nombre_archivo

                mostrar_archivo "$nombre_archivo"

                wait_for_enter

                ;;

            8)

                cambiar_nombre_archivo

                ;;

            9)

                show_title

                echo "Saliendo del instalador Psiphon."

                echo

                exit 0

                ;;

        esac

    done

}

# Ejecutar la función principal

ejecutar

