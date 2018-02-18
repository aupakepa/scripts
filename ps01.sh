# Uso del tr con variable

# Leer un texto por "teclado" y mostrarlo
# Evoluciones:
#	Convertirlo a minusculas (directamente)
#	Convertirlo a minúsculas y mayúsculas (con variable)
echo introduce un texto por teclado
read TECLADO
echo has introducido por teclado `echo $TECLADO | tr [:lower:] [:upper:]`
TECLADO=`echo $TECLADO | tr [:lower:] [:upper:]`
echo hems almacenado en variable $TECLADO
