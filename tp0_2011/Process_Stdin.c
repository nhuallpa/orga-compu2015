#include "Process_Stdin.h"

bool Is_Stdin(int idx,int argc,char* filename){
	return ((argc-1==0)|| 
		((idx<argc)&&(strncmp(filename,STDIN_INDICATOR,strlen(filename))==0)));
}
void show_lines(Type_Stack* ptr_Stack){
	size_t idx=0;
	while (!empty(ptr_Stack)){
		for (idx=0;idx<top(ptr_Stack)->length;++idx)
			printf("%c",top(ptr_Stack)->line[idx]);
		pop(ptr_Stack);
	}
}
int assign(char** line,size_t* idx,char Car){
	(*line)[(*idx)]=Car;
	return 1;
}
int add_character(char** line, size_t* idx,char Car){
	*line=(char*) realloc(*line,*idx+sizeof(char));
	return (*line)?(assign(line,idx,Car)):(ERROR_MSJ(ERROR));
		
}
int store_character(char Car,char** line,size_t* idx){
	int ret=add_character(line,idx,Car);
	++(*idx);
	return ret;
}
int store_line(Type_Stack* ptr_Stack,char** line,size_t* idx){
	push(ptr_Stack,*line,*idx);
	*line=NULL;
	*idx=0;
	return 1;
}
int Process_Stdin(){
	Type_Stack Stack;
	char* line=NULL;
	size_t idx=0;
	char Car;
	int ret=0;
	int ok_proc=1;
	create(&Stack);
	do
	{	
		ret=fscanf(stdin,"%c",&Car);
		if (ret!=EOF) store_character(Car,&line,&idx);
		if ((Car == END_LINE)||(ret==EOF)) ok_proc=store_line(&Stack,&line,&idx);
	}while((ret !=EOF)&&(ok_proc));
	if (ok_proc) show_lines(&Stack);
	if(line) free(line);
	empty(&Stack);
	return ok_proc;
}
