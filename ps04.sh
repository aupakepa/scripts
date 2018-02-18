#ps04.sh
# Parametros Posicionales
# Mostrar los tres primeros parametros
# Determinar el mayor de dos numeros introducidos como parametros
# Evolución:
#    Control de errores: Numero de parametros
#    (a partir de ahora será obligatorio)

echo has introducido $# parametros posicionales
echo el primer parametro es $1
echo el segundo parametro es $2
echo el trecer parametro es $3

if [ $# -ne 3 ]
then
	echo debes introducir 3 parametros posicionales
       exit -1
fi

if [ $1 -gt $2 -a $1 -gt $3 ]
then
	echo $1 es el mayor
elif [ $2 -gt $1 -a $2 -gt $3 ]
then
	echo el parametro 2 $2 es el mayor
else
	echo $3 es el mayor
fi
	 


