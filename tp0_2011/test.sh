#!/bin/sh                                                                                                                                                                       

test_file(){
	for elem in `ls $BASE_DIR_PRUEBA/$type_dir`;do
		if test -f $BASE_DIR_PRUEBA/$type_dir/$elem;then
			if [ $1 -eq 0 ];then
		  		$PROG $BASE_DIR_PRUEBA/$type_dir/$elem > $BASE_DIR_SALIDA/$type_dir/$elem.salida 2> /dev/null
		  	else
		  		$PROG < $BASE_DIR_PRUEBA/$type_dir/$elem > $BASE_DIR_SALIDA/$type_dir/$elem.salida 2> /dev/null
		  	fi
		  diff "$BASE_DIR_SALIDA/$type_dir/$elem.salida" "$BASE_DIR_ESPERADO/$type_dir/$elem.ref" 2>&1 >/dev/null
		  res=$?
		 
		  if [ $res -eq 0 ] 
		  then
		     echo "$elem OK" 
		  else
		     echo "$elem FALLO"
		     exit 1
		  fi  
	   fi  
	done;
}
print_msj(){
	echo -n "Pasaron todas las pruebas ingresando arcvhivos por "
	if [ $1 -eq 0 ];then
		echo "argumento"
	else
		echo "stdin"
	fi
}
BASE_DIR_PRUEBA="Casos_de_prueba"
BASE_DIR_SALIDA="Salida"
BASE_DIR_ESPERADO="Salida_Esperada"
for type_in in {0..1};do
	type_dir="Texto"
	PROG="./tp0"
	test_file $type_in
	type_dir="Binario"
	test_file $type_in
	print_msj $type_in
done;
