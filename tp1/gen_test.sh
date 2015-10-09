#!/bin/bash
#
# Script que genera archivo de test
#
archivo="testMatriz1.txt"
echo "Prueba de archivos grandes"
echo "Generando primer matriz"
rm entrada/${archivo}
./gen_matriz.sh 4000 4000 entrada/${archivo}
echo >> entrada/${archivo}
echo "Gerando segunda matriz"
./gen_matriz.sh 4000 4000 entrada/${archivo}
echo "Ejecutando prueba de matrices enormes"
valgrind ./tp0 < entrada/${archivo} > salida_grande.txt