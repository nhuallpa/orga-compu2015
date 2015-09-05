#!/bin/bash
echo "========================================================================="
echo "Comienzo de pruebas"
echo "========================================================================="
echo "Test 1: Multiplicacion simple 2x2"
cat res/test1.txt | ./tp0 	
echo "-------------------------------------------------------------------------"
echo "Test 2: Multiplicacion media de 8x8"
cat res/test2.txt | ./tp0 	
echo "-------------------------------------------------------------------------"
echo "Test 3: Multiplicacion de dos pares de matrices"
cat res/test3.txt | ./tp0 	
echo "-------------------------------------------------------------------------"
echo "Test 4: Multiplicacion de matrices con dimensiones incorrectas"
cat res/testDimensionIncorrecta.txt | ./tp0 	
echo "========================================================================="
echo "Fin de pruebas"
echo "========================================================================="