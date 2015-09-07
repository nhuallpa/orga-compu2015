#include <stdbool.h>
#include "Definitions.h"
#include "Stack.h"
#ifndef PROCESS_STDIN_H
#define PROCESS_STDIN_H
/*
Pre: Recibe 2 números enteros y un puntero a caracter
Pos: Devuelve true si se va a procesar la entrada estándar o 
	false en caso de que se trate de un archivo.
*/
bool Is_Stdin(int idx,int argc,char* filename);
/*
Pre: Ninguna.
Pos: Procesa la entrada estándar. Devuelve 1 si el procesamiento 
	es satisfactorio. En caso contrario devuelve un número 
	disitinto de 1. 
*/
int Process_Stdin();
#endif
