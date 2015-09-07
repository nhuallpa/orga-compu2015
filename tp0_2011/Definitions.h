#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>

#ifndef DEF_H
#define DEF_H

#define ERROR -1
#define BAD_CALL_CODE -2
#define SINGLE_ARG 1
#define POS_SINGLE 1
#define CAT_AMOUNT 1
#define STDIN_INDICATOR "-"
#define MAXCAR 2
#define END_LINE '\n'
#define EMPTY_CAR ' '
#define TERMINATION_LINE '\0'
#define S_HELP "-h"
#define L_HELP "--help"
#define S_VERSION "-V"
#define L_VERSION "--version"
#define BAD_CALL "Mala invocacion del programa. Ejecute ./tp0 -h para más ayuda\n"
#define NO_REG_FILE "No es archivo regular.\n"

#define TAM_BUFFER 4 

#define HELP(cad) (((strncmp((cad),S_HELP,strlen(S_HELP))==0 ) || ((strncmp((cad),L_HELP,strlen(L_HELP))==0 ))) ?(true):(false))
#define VERSION(cad) (((strncmp((cad),S_VERSION,strlen(S_VERSION))==0 ) || ((strncmp((cad),L_VERSION,strlen(L_VERSION))==0 ))) ?(true):(false))
#define UNSUCCESS_EXECUTION(code)(((code)==ERROR) || ((code)==0) || (code)==BAD_CALL_CODE)
/*
Pre: recibe un puntero a caracter
Pos: devuelve -1 en caso de error, un número ditinto de 0 si
	el archivo es regular y en caso contrario devuelve 0 8cero)
*/
int is_regular(const char* filename);

#endif
