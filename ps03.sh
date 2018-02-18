# ps03.sh
# Uso del condicional completo
# Introduce dos numeros por teclado y dime cual es mayor
echo introduce el primer numero por teclado
read TECLADO
NUM1=$TECLADO
echo introduce el segundo numero por teclado
read TECLADO
NUM2=$TECLADO
if [ $NUM1 -lt $NUM2 ]
then
	echo $NUM1 ES MENOR QUE $NUM2
elif [ $NUM1 -gt $NUM2 ]
then
	echo $NUM1 ES MAYOR QUE $NUM2
else
	echo AMBOS NUMEROS SON IGUALES
fi



