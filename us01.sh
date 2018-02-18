# usr01.sh
# Programa para crear usuarios opcion 1
# Programa borrar usuarios opcion 2
# hacerlo mediante raiz y secuencia
# contraseña igual nombre de usuario
# comprobar si existe el grupo si no crearlo
# comprobar que existe la carpeta de grupo si no crearla
RAIZ=dam
GRP=dam1
GRS=fp
DRAIZ=/home/$GRP
DHOME=/home/$GRP/$USUARIO
SHELL=/bin/bash
SEC=`seq -f%02g 1 15`
OPC=$1
 case $OPC in
	 1)
		 echo comprobamos si el grupo principal existe
		 cat /etc/group | grep ^$GRP:
		 if [ $? -ne 0 ]
		 then
			groupadd $GRP
			echo grupo creado
		else
			echo el grupo $GRP ya existe
		fi
		echo comprobamos si el grupo secundario existe
                 cat /etc/group | grep ^$GRS:
                 if [ $? -ne 0 ]
                 then
                        groupadd $GRS
                        echo grupo creado
                else
                        echo el grupo $GRS ya existe
                fi

		echo comprobamos si existe el directorio raiz
		if [ ! -d  $DRAIZ ]
		then
			echo creamos el directorio raiz del grupo $GRP
			mkdir $DRAIZ
		else
			echo el directorio $DRAIZ ya existe
		fi
for VAR in $SEC
do
	USUARIO=$RAIZ$VAR
	cat /etc/passwd | grep $USUARIO > /dev/null
	if [ $? -ne 0 ]
	then
		DHOME=/home/$GRP/$USUARIO
		echo "Creando usuario $USUARIO"
		useradd -d $DHOME -m -g $GRP -G $GRS -s $SHELL $USUARIO
		(echo $USUARIO;echo $USUARIO) | passwd $USUARIO	
	else
		echo "El usuario que quieres $USUARIO  ya existe"
	fi
done
;;
	2)
		for VAR in $SEC
		do
		USUARIO=$RAIZ$VAR
        cat /etc/passwd | grep $USUARIO > /dev/null
        if [ $? -eq 0 ]
        then
		DHOME=/home/$GRP/$USUARIO
                echo "Borrando usuario $USUARIO"
                userdel $USUARIO
		echo borrando directorio del usuario
                rm -r $DHOME
        else
                echo "El usuario que quieres $USUARIO  no existe"
        fi
		done
	echo borrando el directorio del grupo
	rm -r $DRAIZ
	echo borrando grupo principal
	groupdel $GRP
	echo borrando grupo secundario
	groupdel $GRS
	echo supuestamente todo borrado
		;;
	*) exit -1
esac
