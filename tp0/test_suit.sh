#!/bin/bash
echo "========================================================================="
echo "Comienzo de pruebas"
echo "========================================================================="
echo "Test 1: Multiplicacion simple 2x2."
cat entrada/test1.txt | ./tp0 	
echo "-------------------------------------------------------------------------"
echo "Test 2: Multiplicacion media de 8x8."
cat entrada/test2.txt | ./tp0 	
echo "-------------------------------------------------------------------------"
echo "Test 3: Multiplicacion de dos pares de matrices."
cat entrada/test3.txt | ./tp0 	
echo "-------------------------------------------------------------------------"
echo "Test 4: Multiplicacion de matrices con dimensiones incorrectas."
cat entrada/testDimensionIncorrecta.txt | ./tp0
echo "-------------------------------------------------------------------------"
echo "Test 5: Dimension de matriz leida incorrecta."
cat entrada/testElementoIncorrecto1.txt | ./tp0
echo "-------------------------------------------------------------------------"
echo "Test 6: Elemento de matriz leida incorrecta."
cat entrada/testElementoIncorrecto2.txt | ./tp0
echo "-------------------------------------------------------------------------"
echo "Test 7: Multiplicacion de matrices impares(solo una matriz cargada)."
cat entrada/testImpar1.txt | ./tp0
echo "-------------------------------------------------------------------------"
echo "Test 8: Multiplicacion de matrices impares(5 matrices cargadas)."
cat entrada/testImpar2.txt | ./tp0
echo "-------------------------------------------------------------------------"
echo "Test 9: Multiplicacion de matrices cuando la cantidad de elementos es manor."
cat entrada/testFormat3.txt | ./tp0
echo "-------------------------------------------------------------------------"
echo "Test 10: Multiplicacion de matrices cuando la cantidad de elementos es menor."
cat entrada/testFormat4.txt | ./tp0
echo "-------------------------------------------------------------------------"
echo "Test 11: Multiplicacion de matrices cuando la cantidad de elementos es mayor(TERMINAR...)."
cat entrada/testCantElementosIncorrectos.txt | ./tp0
echo "========================================================================="
echo "Fin de pruebas"
echo "========================================================================="
