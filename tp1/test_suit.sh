#!/bin/sh

mostrar_resultado_test()
{
	if [ $1 -eq $2 ]
	then
		echo "OK" 
	else
		echo "FALLO"
	fi
}

test_multiplicacion(){
	cat "entrada/$1.txt" | ./tp1 > "resultado/$1.txt"
	if [ $? -eq $2 ]
	then		
		diff "resultado/$1.txt" "resultado_esperado/$1.txt" 2>&1 >/dev/null
		mostrar_resultado_test $? 0
	else
		echo "FALLO"
	fi	
}

echo "Prueba 1:"
test_multiplicacion "test1" 0
		  
echo "-------------------------------------------------------------------------"
echo "Prueba 2:"
test_multiplicacion "test2" 0

echo "-------------------------------------------------------------------------"
echo "Prueba 3:"
test_multiplicacion "test3" 0

echo "-------------------------------------------------------------------------"
echo "Prueba 4:"
cat entrada/testDimensionIncorrecta.txt | ./tp1
mostrar_resultado_test $? 4

echo "-------------------------------------------------------------------------"
echo "Prueba 5:"
cat entrada/testElementoIncorrecto1.txt | ./tp1
mostrar_resultado_test $? 5

echo "-------------------------------------------------------------------------"
echo "Prueba 6:"
cat entrada/testElementoIncorrecto2.txt | ./tp1
mostrar_resultado_test $? 6

echo "-------------------------------------------------------------------------"
echo "Prueba 7:"
cat entrada/testImpar1.txt | ./tp1
mostrar_resultado_test $? 7

echo "-------------------------------------------------------------------------"
echo "Prueba 8:"
cat entrada/testFormat3.txt | ./tp1
mostrar_resultado_test $? 8

echo "-------------------------------------------------------------------------"
echo "Prueba 9:"
cat entrada/testFormat4.txt | ./tp1
mostrar_resultado_test $? 9

