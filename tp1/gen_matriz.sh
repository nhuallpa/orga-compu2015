#!/bin/bash
#
# Script que genera una matriz aleatoria
# Parametro 1: Cantidad de filas
# Parametro 2: Cantidad de columnas
# Uso: ./gen_matriz.sh cantFilas cantCol > archivo.txt
#
filas=$1
columnas=$2
archivo=$3

echo -n "${filas}x${columnas}" >> ${archivo}

for i in `seq 1 ${filas}` 
do
	for j in `seq 1 ${columnas}` 
	do
		randomnum=$(( ( RANDOM % 10 )  + 1 ))
		echo -n  " $randomnum" >> ${archivo}
	done
done

echo -e "" >> ${archivo}
