#s10.sh
# Parametros posicionales: Recorrido con for
echo Nombre del script: $0
echo Numero de Parametros: $#
echo "Lista de parametros (*):" $*
echo "Lista de parametros (@):" $@

for VAR
do
	CONT=`expr $CONT + 1`
done
echo $CONT
echo la suma de parametros es $CONT

