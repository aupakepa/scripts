#ps12.sh
# uso del test -s para comprobar que se encuentran elementos con find
# Se buscará el elemento introducido como parametro posicional y se indicará si existe alguno o no
# Evoluciones:
#     Introducir cualquier numero de elementos a buscar
#     Contarlos y mostrar un mensaje adecuado (uso del plural)
CONT=1

if [ $# -eq 0 ]
then
	echo no se han introducido parametros posicionales
fi
echo se han introducido $# parametros posicionales
OPC=$1
shift

while [ $# -gt 0 ]

do
	find / -type $OPC -name "$1" >salida 2>/dev/null
	if [ ! -s salida ]
	then
		echo no se ha encontrado el elemento $1
	else
	EXISTE=`cat salida | wc -l`
	echo se han encontrado $EXISTE elementos de $1
	fi
	shift
done
