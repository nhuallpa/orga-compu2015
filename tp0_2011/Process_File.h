#include <stdio.h>
#include "stdlib.h"
#include "Definitions.h"
#include "Message.h"

#ifndef PROCESS_H
#define PROCESS_H
/*
Pre: Recibe un puntero a caracter que contiene el nombre del archivo 
	que se quiere procesar y 2 números enteros
Pos: El valor de retorno pude ser -1,0  o -2. -1 en caso de que el
	archivo sea inexistente. 0 en caso de que no se trate de un archivo
	regular y -2 en caso que que la invocación del programa sea 
	inválida.
*/
int Process_File(char* filename,int argc,int idx);
#endif
