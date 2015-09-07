#!/bin/sh
create(){
	if [ ! -d "$1" ];then
		    mkdir $1
	fi		
}
check_and_create(){
	create $1
	create $1/Texto
	create $1/Binario
}
BASE_DIR_PRUEBA="Casos_de_prueba"
BASE_DIR_ESPERADO="Salida_Esperada"
BASE_DIR_SALIDA="Salida"

check_and_create $BASE_DIR_PRUEBA
check_and_create $BASE_DIR_ESPERADO
check_and_create $BASE_DIR_SALIDA
 
for i in {0..10};do
	dd if=/dev/urandom of=$BASE_DIR_PRUEBA/Binario/azar.$i.entrada bs=1 count=$(($i*1024))
	tac <$BASE_DIR_PRUEBA/Binario/azar.$i.entrada >$BASE_DIR_ESPERADO/Binario/azar.$i.entrada.ref
done
Cantidad_archivos=`ls -l $BASE_DIR_PRUEBA/Texto | grep '^-' | wc -l`
if [ $Cantidad_archivos -eq 0 ];then
	echo "En el directorio $BASE_DIR_PRUEBA/Texto debe poner los archivos de texto para usar como prueba."
	echo "Ponga los archivos en esta carpeta y vuelva a ejecutar el programa"
	exit 1;
fi
for elem in `ls $BASE_DIR_PRUEBA/Texto`;do
	if test -f $BASE_DIR_PRUEBA/Texto/$elem;then
		tac <$BASE_DIR_PRUEBA/Texto/$elem >$BASE_DIR_ESPERADO/Texto/$elem.ref
	fi
done
