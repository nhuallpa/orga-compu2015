#include "Definitions.h"
#include <errno.h>
#include <string.h>
#include <stdbool.h>
#ifndef MSJ_H
#define MSJ_H
/*
Pre: recibe un puntero a caracter.
Pos: Si no es opcion para imprimir ayuda o versión o el puntero a
	caracter es NULL, devuelve false. Sino devuelve true.
*/
bool Is_Option(char* opt);
/*
Pre: Recibe un puntero a caracter. Dicho puntero debe ser 
	distinto de NULL
Pos: Dependiendo del valor a donde apunta opt imprimirá o bien el
	mensaje de ayuda o la versión.
*/
void Print_Option_Msg(char* opt);
/*
Pre:Recibe un numero entero que representa el código de error.
Pos: Si code == -1 imprime un error or stderr de acuero a la 
	variable externa ""errno". Si code no es -1 entonces imprime
	por stderr un mensaje informativo. Dicho mensaje puede ser:
	Mala invocación del programa o que no se trata de un archivo 
	regular.
*/
int ERROR_MSJ(int code);
#endif
