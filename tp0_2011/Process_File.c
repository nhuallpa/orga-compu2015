#include "Process_File.h"
#include "Definitions.h"

typedef struct t_reg_datos{
    size_t fin_pos;
    size_t actual_pos;
    char ultimo;
    FILE* fichero;
    bool fin_encontrado;
}t_reg_datos;
void Imprimir_Linea(t_reg_datos* ptr_reg_datos){
    char Car;
    size_t idx=0;
    if (ptr_reg_datos->actual_pos==0){
		fseek(ptr_reg_datos->fichero,ptr_reg_datos->actual_pos,SEEK_SET);
		++ptr_reg_datos->fin_pos;
	}
	for(idx=ptr_reg_datos->actual_pos;idx<ptr_reg_datos->fin_pos;++idx){
	    if (fread(&Car,1,sizeof(char),ptr_reg_datos->fichero)==1)
			printf("%c",Car);
	}
	fseek(ptr_reg_datos->fichero,ptr_reg_datos->actual_pos,SEEK_SET);
    ptr_reg_datos->fin_pos=ptr_reg_datos->actual_pos;
}
void Identificar_Linea_e_Imprimir(char Car,t_reg_datos* ptr_reg_datos){
	if ((Car==END_LINE) || (ptr_reg_datos->actual_pos==0)){
        Imprimir_Linea(ptr_reg_datos);
    }
    ptr_reg_datos->ultimo=Car;
}
int Process_File(char* filename,int argc,int idx){
	int ret=1;
	if (idx<argc){
		char Car=EMPTY_CAR;
		t_reg_datos reg_datos={0,0,TERMINATION_LINE,fopen(filename,"rb"),false};
		int offset=-1;
		if (reg_datos.fichero){
			fseek(reg_datos.fichero,0,SEEK_END);
			reg_datos.fin_pos=ftell(reg_datos.fichero);
				ret=is_regular(filename);
				if ((ret==ERROR)||(!ret)) return ret;
				    do{
				        fseek(reg_datos.fichero,offset,SEEK_END);
				        reg_datos.actual_pos=ftell(reg_datos.fichero);
				        if (reg_datos.actual_pos>=0){
				            fread(&Car,sizeof(char),1,reg_datos.fichero);   
				            Identificar_Linea_e_Imprimir(Car,&reg_datos);
				        }
				        --offset;
				    }while(reg_datos.actual_pos>0);   
			fclose(reg_datos.fichero);
		}else	ret=(Is_Option(filename))?(BAD_CALL_CODE):(ERROR);
	}
	return ret;
}
