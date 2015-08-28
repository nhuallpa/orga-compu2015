#include <stdio.h>
#include <stdlib.h>
int main(int argc, const char* argv[]) {


	// leer archivo de entrada y cargar en una struct
	
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
		   printf("%s",line);
		}
    	
	    fclose(fp);
	}
	
	// hacer post validaciones
	
	// multipliacacion de la matriz
	
	// imprimir la matriz por stdout


  int* ptr;
  int n=10;

  ptr = (int*)malloc(n*sizeof(int));

  int i = 0;
  for (i=0; i<n; i++) {
	ptr[i] = i;
  }
  
  for (i=0; i<n; i++) {
	printf("%d, ", ptr[i]);
  }

	printf("\n" );

  free(ptr);
  
  return 0;
}
