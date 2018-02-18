#s13.sh

# Mostrar el contenido de un fichero (recibido como parametro)
#    Comprobar que el fichero existe (con test -f)
#    Mostrar solo los 20 primeros caracteres de cada linea

# Evoluciones:
#     Mostrar el numero de linea (Linea n:) y luego los 20 primeros caracteres
#     Recibir el numero de caracteres compo segundo parametro
CONT=0
FICHERO=$1
if [ $# -lt 2 -o $# -gt 2 ]
then echo no se han introducido los parametros adecuados
	exit -1
else
echo procedemos a mostrar los $2 caracteres las lineas del fichero $1
fi

if [ ! -f $FICHERO ]
then echo el fichero $FICHERO no existe
else
	while
		read LINEA
	do
		 CONT=`expr $CONT + 1 `
	LIN=`echo $LINEA | cut -c1-$2`
	echo $CONT.- $LIN
	done <$FICHERO
fi
