#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char* argv[]) {

	
	typedef struct {
	   int cantFil;
	   int cantCol;
	   int** datos;
	} matriz;	
	
	
	matriz m_a;
	matriz m_b;
	int i,j;
	
	/* se lee el archivo para leer las dimensiones de las matrices */
	FILE *fp = fopen("entrada01.txt", "r");

	if (fp == NULL) {
	  fprintf(stderr, "Can't open input file in.list!\n");
	  exit(1);
	}
	else
	{
		char line[999];
	    
	    while( fgets(line,999,fp) )
	    {
	    	// TODO leer las dimensiones de cada una de las filas
		   	printf("%s",line);
		}
		
		// dimesiones hard-codeadas
		m_a.cantFil = 2;
		m_a.cantCol = 2;    	
		m_b.cantFil = 2;
		m_b.cantCol = 2;		
		
	    fclose(fp);
	}

	/* se aloja memoria para la matriz a */
	m_a.datos = ((int**)malloc(m_a.cantFil*sizeof(int*)));
	if(m_a.datos==NULL){
		printf("\n\t\tERROR:MEMORIA INSUFICIENTE PARA MATRIZ A");
		exit(1);
	}

	for(i=0;i<m_a.cantFil;i++)
	{
		m_a.datos[i] = ((int*)malloc(m_a.cantCol*sizeof(int)));
		if(m_a.datos[i]==NULL)
		{
			printf("\n\t\tERROR:MEMORIA INSUFICIENTE PARA MATRIZ A");
			exit(-1);
		}	
	}	
	
	/* se aloja memoria para la matriz b */
	m_b.datos = ((int**)malloc(m_b.cantFil*sizeof(int*)));
	if(m_b.datos==NULL)
	{
		printf("\n\t\tERROR:MEMORIA INSUFICIENTE PARA MATRIZ B");
		exit(1);
	}

	for(i=0;i<m_b.cantFil;i++)
	{
		m_b.datos[i] = ((int*)malloc(m_b.cantCol*sizeof(int)));
		if(m_b.datos[i]==NULL){
			printf("\n\t\tERROR:MEMORIA INSUFICIENTE PARA MATRIZ A");
			exit(-1);
		}	
	}
	
	
	
	/* se cargan los datos para las 2 matrices desde el archivo*/
	
	fp = fopen("entrada01.txt", "r");
	if (fp == NULL) {
	  fprintf(stderr, "Can't open input file in.list!\n");
	  exit(1);
	}
	else
	{
		char line[999];
	    
	    while( fgets(line,999,fp) )
	    {
	    	// TODO leer el contenido para las matrices
		}

		// datos hard-coding para la matriz a
		int num = 0;
		for(i=0;i<m_a.cantFil;i++){
			for(j=0;j<m_a.cantCol;j++){
				m_a.datos[i][j] = num++;
			}
		}
    	
		// datos hard-coding para la matriz b
		for(i=0;i<m_b.cantFil;i++){
			for(j=0;j<m_b.cantCol;j++){
				m_b.datos[i][j] = num++;
			}
		}    	
    	
    	
		// imprimir las matrices por stdout
		for(i=0;i<m_a.cantFil;i++){
			printf("\n|");
			for(j=0;j<m_a.cantCol;j++){
				printf("\t%i\t| ",m_a.datos[i][j]);
			}
		}
		printf("\n");    	
		
		for(i=0;i<m_b.cantFil;i++){
			printf("\n|");
			for(j=0;j<m_b.cantCol;j++){
				printf("\t%i\t| ",m_b.datos[i][j]);
			}
		}		
		printf("\n");
		printf("Todavia falta tomar las matrices originales desde el archivo de entrada\n");    	    	
    	
	    fclose(fp);
	}	
	
	
	// hacer post validaciones
	
	// multipliacacion de la matriz
	
	// imprimir la matriz resultado por stdout

  
  return 0;
}
