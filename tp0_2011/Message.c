#include "Message.h"
extern int errno;
void Help_Msg(){
	printf("Usage: \n\ttp0 -h\n\t");
	printf("tp0 -V\n\t");
	printf("tp0 [file ...]\nOptions:\n\t");
	printf("-V, --version\tPrint version and quit\n\t");
	printf("-h, --help\tPrint this information and quit\n");
}
void Version_Msg(){
	printf("Version 1.1 - Integrantes del Grupo: Martinez Ariel, Ali Luis, Dworjanyn Enrique\n");
}	
bool Is_Option(char* opt){
	return (opt)?((HELP(opt))||(VERSION(opt))):(false);
}

void Print_Option_Msg(char* opt){
	(HELP(opt))?(Help_Msg()):(Version_Msg());
}

void print_custom_msj(int code){
	(!code)?
	(fprintf(stderr,NO_REG_FILE)):
	(fprintf(stderr,BAD_CALL));
}
int ERROR_MSJ(int code){
	(code==ERROR)?
	(perror(strerror(errno))):
	(print_custom_msj(code));
	return 1;
}
