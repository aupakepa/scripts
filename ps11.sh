#s11.sh
# Parametros posicionales: Recorrido con while
echo Nombre del script: $0
echo
echo Numero de Parametros: $#
echo "Lista de parametros:" $*
CONT=1
while [ $# -ne 0 ]
do
	echo el parametro $CONT es = $1
	CONT=`expr $CONT + 1`
	shift
done
