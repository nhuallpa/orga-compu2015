#include <stdbool.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "Message.h"
#ifndef STACK_H
#define STACK_H

typedef struct Type_Node
{
	char* line;
	size_t length;
	struct Type_Node *next;
}Type_Node;

typedef struct Type_Stack
{
	Type_Node *Top;
}Type_Stack;
/*
Pre: Recibe un puntero a una pila
Pos: Crea una pila (stack) vacia
*/
void create(Type_Stack* ptr_Stack);
/*
Pre: Recibe un puntero a una pila
Pos: Devuelve true si la pila esta vacia, sino false
*/
bool empty(Type_Stack* ptr_Stack);
/*
Pre: Recibe un puntero a una pila, un puntero a caracter que apunta al comienzo
	de la línea y en length la longitud de dicha línea.
Pos: Inserta el puntero a caracter en la pila
*/
int push(Type_Stack* ptr_Stack,char* line,size_t length);
/*
Pre: Recibe un puntero a una pila. La pila no debe esar vacía.
Pos: Elimina el tope de la pila
*/
void pop(Type_Stack* ptr_Stack);
/*
Pre: Recibe un puntero a una pila
Pos: Devuelve el contenido (un puntero a caracter) del elemento 
	tope de la pila.
*/
Type_Node* top(Type_Stack* ptr_Stack);
/*
Pre: Ninguna
Pos: Elimina la pila
*/
void destroy(Type_Stack* ptr_Stack);
#endif
