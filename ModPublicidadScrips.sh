echo -e "Texto #1 (Nombre del Vendedor): "

read Texto

echo "Se a modificado a: $Texto"

perl -pi -e "s[Texto1][$Texto]g" /etc/dropbear/banner

echo ""
echo -e "Texto #2 (Nombre del Script): "

read Textoo

echo "Se a modificado a: $Textoo"

perl -pi -e "s[Texto2][$Textoo]g" /etc/dropbear/banner

echo " Finalizado von éxito"

exit
