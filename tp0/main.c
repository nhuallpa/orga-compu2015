#include <stdio.h>
#include <stdlib.h>

typedef struct {
       int cantFil;
       int cantCol;
       double** datos;
} matriz;

void imprimirMatriz(matriz* p_m) {
    int i,j;
    for(i=0;i<(*p_m).cantFil;i++){
        printf("\n|");
        for(j=0;j<(*p_m).cantCol;j++){
            printf("\t%lf\t| ",(*p_m).datos[i][j]);
        }
    }
    printf("\n");
}

int main(int argc, const char* argv[]) {

	matriz m_a;
	matriz m_b;
	int i,j;
    char* equis = ((char*)malloc(sizeof(char)));

	// validacion del parametro del programa
	if ( argc <= 1 )
	{
	  fprintf(stderr, "El programa necesita un parametro(archivo de entrada)\n");	
	  exit(1);	
	}

	const char* entrada = argv[1];
	
	/* 	
	OTRAS VALIDACIONES:

	# ver que el archivo no existe (ya esta hecho y probado) 
	# Verificar si el archivo de entrada viene con una sola matriz.
	# Se pueda muliplicar las matrices, por ejemplo si las 2 matricez en el archivo de entrada son de 2 x2 verificar que hallan 4 elementos
	# verificar cuando el archivo viene mal formado, por ejemplo en vez de un numero viene un string
	# ver que termine bien cuando no hay memoria. si malloc=NULL entonces ver los mensajes de erorr por stderror (esto esta hecho, pero no lo probe).

	*/

	/* se lee el archivo para leer las dimensiones de las matrices */
	FILE *fp = fopen(entrada, "r");

	if (fp == NULL) {
	  fprintf(stderr, "No se puedo abrir el archivo %s\n",entrada);
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

	    fclose(fp);
	}




	/* se cargan los datos para las 2 matrices desde el archivo*/

	fp = fopen(entrada, "r");
	if (fp == NULL) {
	  fprintf(stderr, "No se puedo abrir el archivo %s\n",entrada);
	  exit(1);
	}
	else
	{
	    while(!feof(fp))
	    {
            // Se leen los valores desde el archivo de fila columna y separador de ambos
            fscanf(fp, "%d" , &m_a.cantFil);if(feof(fp))break;  //Break temporario hasta que encontremos el fix
            fscanf(fp, "%c" , equis);                           //porque por alguna razón no llega el fin de archivo antes
            fscanf(fp, "%d", &m_a.cantCol);

            // Handlers de archivos mal ingresados
            if (m_a.cantFil<0){
                printf("\n\t\tERROR: FILA INGRESADA INVALIDA PARA MATRIZ A");
                exit(1);
            }
            if (m_a.cantCol<0){
                printf("\n\t\tERROR: COLUMNA INGRESADA INVALIDA PARA MATRIZ A");
                exit(1);
            }
            	/* se aloja memoria para la matriz a */
            m_a.datos = ((double**)malloc(m_a.cantFil*sizeof(double*)));
            if(m_a.datos==NULL){
                printf("\n\t\tERROR:MEMORIA INSUFICIENTE PARA MATRIZ A");
                exit(1);
            }

            for(i=0;i<m_a.cantFil;i++)
            {
                m_a.datos[i] = ((double*)malloc(m_a.cantCol*sizeof(double)));
                if(m_a.datos[i]==NULL)
                {
                    printf("\n\t\tERROR:MEMORIA INSUFICIENTE PARA MATRIZ A");
                    exit(-1);
                }
            }

            // Se cargan los datos de la matriz A
            for(i=0;i<m_a.cantFil;i++){
                for(j=0;j<m_a.cantCol;j++){

                    fscanf(fp, "%lf", &m_a.datos[i][j]);

                }
            }
            // Se leen los valores desde el archivo de fila columna y separador de ambos
            fscanf(fp, "%d" , &m_b.cantFil);
            fscanf(fp, "%c" , equis);
            fscanf(fp, "%d", &m_b.cantCol);

            if (m_b.cantFil<0){
                printf("\n\t\tERROR: FILA INGRESADA INVALIDA PARA MATRIZ A");
                exit(1);
            }
            if (m_b.cantCol<0){
                printf("\n\t\tERROR: COLUMNA INGRESADA INVALIDA PARA MATRIZ A");
                exit(1);
            }

            /* se aloja memoria para la matriz b */
            m_b.datos = ((double**)malloc(m_b.cantFil*sizeof(double*)));
            if(m_b.datos==NULL)
            {
                printf("\n\t\tERROR:MEMORIA INSUFICIENTE PARA MATRIZ B");
                exit(1);
            }

            for(i=0;i<m_b.cantFil;i++)
            {
                m_b.datos[i] = ((double*)malloc(m_b.cantCol*sizeof(double)));
                if(m_b.datos[i]==NULL){
                    printf("\n\t\tERROR:MEMORIA INSUFICIENTE PARA MATRIZ A");
                    exit(-1);
                }
            }

            // Se cargan los datos de la matriz B
            for(i=0;i<m_b.cantFil;i++){
                for(j=0;j<m_b.cantCol;j++){

                    fscanf(fp, "%lf", &m_b.datos[i][j]);

                }
            }

		}

		// imprimir las matrices por stdout
	
        imprimirMatriz(&m_a);

        imprimirMatriz(&m_b);

	    fclose(fp);

        // hacer post validaciones

	    if (m_a.cantCol != m_b.cantFil){
	    	printf("\n\t\t ERROR:NO SE PUEDEN MULTIPLICAR LAS MATRICES DEBIDO A SUS DIMENSIONES");
	    }else{
        // multipliacacion de la matriz
        matriz m_c;
        m_c.cantFil = m_a.cantFil;
        m_c.cantCol = m_b.cantCol;
        m_c.datos = ((double**)malloc(m_c.cantFil*sizeof(double*)));
        if (m_c.datos==NULL){
            printf("\n\t\tERROR:MEMORIA INSUFICIENTE PARA MATRIZ A");
            exit(1);
        }
        for (i=0; i<m_c.cantFil; i++) {
            m_c.datos[i] = ((double*)malloc(m_c.cantCol*sizeof(double)));
            if(m_c.datos[i]==NULL)
            {
                printf("\n\t\tERROR:MEMORIA INSUFICIENTE PARA MATRIZ A");
                exit(-1);
            }
        }

        int k = 0;
        double suma = 0.0;
        for (i=0; i<m_c.cantFil; i++) {
            for (j=0; j<m_c.cantCol; j++) {
            	suma = 0.0;
                for (k=0; k<m_a.cantCol;k++) {
                    suma = suma + (m_a.datos[i][k] * m_b.datos[k][j]);
                }

                m_c.datos[i][j] = suma;
            }
        }

        // imprimir la matriz resultado por stdout
        imprimirMatriz(&m_c);

        // liberar memoria
        for(i=0;i<m_c.cantFil;i++){
            free(m_c.datos[i]);
        }
        free(m_c.datos);
    	}

        for(i=0;i<m_a.cantFil;i++){        
            free(m_a.datos[i]);
        }
        free(m_a.datos);

        for(i=0;i<m_b.cantFil;i++){
            free(m_b.datos[i]);
        }
        free(m_b.datos);

        free(equis);

	}
    return 0;
}


