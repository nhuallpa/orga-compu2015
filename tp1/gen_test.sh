#!/bin/bash
#
# Script que genera archivo de test
#
archivo="testMemoria.txt"
echo "Prueba de archivos grandes"
echo "Generando primer matriz"
rm entrada/${archivo}
source gen_matriz.sh 4000 4000 entrada/${archivo}
echo >> entrada/${archivo}
echo "Gerando segunda matriz"
source gen_matriz.sh 4000 4000 entrada/${archivo}
echo "Ejecutando prueba de matrices enormes"
#./tp1 < entrada/${archivo}
