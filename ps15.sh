#s15.sh

# Sintaxis: s15.sh opc lista de elementos
# opciones válidas:
#    r: Mostrar que se va a borrar el fichero (sin borrarlo)
#    c: Mostrar el contenido del fichero
#    t: Mostrar el tipo de elemento

# Opción r:
#    la lista de ficheros será con nombre completo o relativo
#    deberá comprobarse la existencia del elemento utilizando test -f 

# Opcion c:
#    la lista se escribirá con nombres terminales
#    deberá utilizarse find para buscarlos en todo el sistema de ficheros
#    para cada elemento se mostrará:
#       Contenido de Nombre_de_fichero
#       ------------------------------
#       Aquí: todas las lineas del fichero)
#       ...
#       Aquí: una línea en blanco

# Opcion t:
#    la lista se escribirá con nombres terminales
#    deberá utilizarse find para buscarlos en todo el sistema de ficheros
#    para cada elemento se mostrará:
#		Nombre_de_elemento: Tipo_de_elemento
# Siendo Tipo_de_elemento uno de los siguientes:
#     Fichero
#     Directorio
#     Enlace simbólico
#     Otro elemento
#
# Al finalizar se presentará un resumen:
#   Ficheros: numero
#   Directorios: numero
#   Enlaces: numero
#   Otros: numero
#   Total: numero

OPC=`echo $1 | tr [:upper:] [:lower:]`
DIR=0
ENL=0
OTR=0
TOT=0
FIC=0


shift
case $OPC in

	r)
for VAR
		
do
	if [ ! -f $VAR ]
		then  
			echo el fichero no existe
		else
			echo se va a borrar $VAR
	fi
done
		;;
	c) 
		for VAR
		do
			echo Contenido de Nombre_de_fichero
	     		echo ------------------------------
			find / -type f -name $VAR -exec cat {} \; 2>/dev/null
			echo ...
			echo
		done
		;;
	t)
		for VAR
		do
			find / -name $VAR -exec ls -lad {} \; >salida 2>/dev/null
			DIR=0
                                ENL=0   
                                OTR=0
                                TOT=0
                                FIC=0

			while
				read LINEA
			do
				TIPO=`echo $LINEA | cut -c1`
				test $TIPO = "d" && DIR=`expr $DIR + 1 `
				test "$TIPO" = "l" && ENL=`expr $ENL + 1 `
				test "$TIPO" = "-" && FIC=`expr $FIC + 1 `
				TOT=`expr $TOT + 1 `
			
			
			done < salida
				echo del nombre $VAR se encuentran
				echo -------------------------
				echo Directorios: $DIR
				echo Enlaces: $ENL
				echo Ficheros: $FIC
				echo Total: $TOT
		done		
		;;
		esac

