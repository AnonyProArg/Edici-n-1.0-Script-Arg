#!/bin/bash
clear
sudo apt update
sudo apt install -y fbsetbg
wget -O /usr/local/share/backgrounds/tu_imagen.png https://github.com/AnonyProArg/ScriptsRobloz/blob/main/53471c95341c1d613c65d846ff39b3e5.png
clear
sudo fbsetbg -f /usr/local/share/backgrounds/tu_imagen.png
clear

install_psiphon() {
    clear
    echo "Instalando Psiphon..."
    apt update
    apt install screen -y
    wget 'https://docs.google.com/uc?export=download&id=1Cg_YsTDt_aqK_EXbnzP9tRFSyFe_7N-m' -O 'psiphond'
    chmod 775 psiphond
    ./psiphond --ipaddress 0.0.0.0 --protocol FRONTED-MEEK-HTTP-OSSH:80 --protocol FRONTED-MEEK-OSSH:443 generate
    chmod 666 psiphond.config psiphond-traffic-rules.config psiphond-osl.config psiphond-tactics.config server-entry.dat
    screen -dmS psiserver ./psiphond run
    echo "Psiphon instalado y en ejecución."
}

install_badvpn() {
    clear
    echo "Instalando BadVpn..."
    apt update
    apt install badvpn -y
    screen -dmS badvpn badvpn-udpgw --listen-addr 0.0.0.0:7300
    echo "BadVpn instalado y en ejecución en el puerto 7300."
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
            break
            ;;
        *)
            echo "Opción inválida. Por favor, selecciona una opción válida."
            ;;
    esac

    echo
done
clear
