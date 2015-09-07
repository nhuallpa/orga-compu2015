#include "Stack.h"

void create(Type_Stack* ptr_Stack){
	ptr_Stack->Top=NULL;
}

bool empty(Type_Stack* ptr_Stack){
	return (ptr_Stack->Top==NULL);
}

int push(Type_Stack* ptr_Stack,char* line,size_t length){
	Type_Node* ptr_NewNode=(struct Type_Node*) 
							calloc(1,sizeof(struct Type_Node));
	if (ptr_NewNode){
		ptr_NewNode->line=line;
		ptr_NewNode->length=length;
		ptr_NewNode->next=(empty(ptr_Stack))?(NULL):(ptr_Stack->Top);
		ptr_Stack->Top=ptr_NewNode;
	}else
		return ERROR_MSJ(ERROR);
	return 0;
}

void pop(Type_Stack* ptr_Stack){
	struct Type_Node* aux=ptr_Stack->Top;
	ptr_Stack->Top=ptr_Stack->Top->next;
	free(aux->line);
	free(aux);
}

Type_Node* top(Type_Stack* ptr_Stack){
	return ptr_Stack->Top;
}

void destroy(Type_Stack* ptr_Stack){
	while (!empty(ptr_Stack))
		pop(ptr_Stack);
}
