# ps02.sh
# Uso del condicional
# Leer un numero por "teclado"
# Comprobar si el numero es igual o distinto que 10
echo introduce un numero por teclado
read TECLADO
if [ $TECLADO -gt 10 ]
then
	echo el numero introducido $TECLADO es mayor que 10
else 
	echo el numero intrducido es menor que 10
fi
