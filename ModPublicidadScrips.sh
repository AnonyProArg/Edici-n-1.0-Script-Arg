echo -e "Texto #0 (tu texto): "

read Textooo

echo "Se a modificado a: $Texto"

perl -pi -e "s[Texto0][$Textooo]g" /etc/dropbear/banner

echo ""

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
