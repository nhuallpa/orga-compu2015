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

	    fclose(fp);
	}




	/* se cargan los datos para las 2 matrices desde el archivo*/

	fp = fopen("entrada01.txt", "r");
	if (fp == NULL) {
	  fprintf(stderr, "Can't open input file in.list!\n");
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

            // aqui solo un resumen de lo que nos quedaria por hacer una ves
            // ingresadas las matrices y cargadas en memoria

		}

		// imprimir las matrices por stdout
	
        imprimirMatriz(&m_a);

        imprimirMatriz(&m_b);

	    fclose(fp);

        // hacer post validaciones

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

        
        for (i=0; i<m_c.cantFil; i++) {
            for (j=0; j<m_c.cantCol; j++) {
                int k = 0;
                double suma = 0.0;
                for (k=0; k<m_a.cantCol;k++) {
                    suma = suma + (m_a.datos[i][k] * m_b.datos[k][j]);
                }

                m_c.datos[i][j] = suma;
            }
        }

        // imprimir la matriz resultado por stdout
        imprimirMatriz(&m_c);

        // liberar memoria
        for(i=0;i<m_a.cantFil;i++){        
            free(m_a.datos[i]);
        }
        free(m_a.datos);

        for(i=0;i<m_b.cantFil;i++){
            free(m_b.datos[i]);
        }
        free(m_b.datos);

        for(i=0;i<m_c.cantFil;i++){
            free(m_c.datos[i]);
        }
        free(m_c.datos);

        free(equis);

	}
    return 0;
}


