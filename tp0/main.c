/**
*   6620 - Organizacion del computador 
*   Trabajo Practico 0 
*   Alumnos: 
*           88614 - Huallpa Porcel
*           XXXXX - Ariel Martinez
*           XXXXX - Facundo Caldora
*/

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>

typedef struct {
       int cantFil;
       int cantCol;
       double** datos;
} matriz;

void imprimirMatriz(matriz* p_m) {
    int i,j;
    printf("%dX%d", (*p_m).cantFil, (*p_m).cantCol);
    for(i=0;i<(*p_m).cantFil;i++){
        
        for(j=0;j<(*p_m).cantCol;j++){
            printf(" %4.2lf",(*p_m).datos[i][j]);
        }
    }
    printf("\n");
}

int main(int argc, char** argv) {

    int siguiente_opcion;

    /* Una cadena que lista las opciones cortas validas */
    const char* const op_cortas = "hV";

    /* Una estructura de varios arrays describiendo los valores largos */
    const struct option op_largas[] =
    {
      { "help",           0,  NULL,  'h'},
      { "version",        0,  NULL,  'V'},
      { NULL,             0,  NULL,   0 }
    };


    while (1) {
        /* Llamamos a la funci�n getopt */
        siguiente_opcion = getopt_long (argc, argv, op_cortas, op_largas, NULL);
        if (siguiente_opcion == -1) break;
        switch (siguiente_opcion) {
            case 'h' :
                printf("Usage:\n");
                printf("\ttp0 -h\n");
                printf("\ttp0 -V\n");
                printf("\ttp0 < in_file > out_file\n");
                printf("Options:\n");
                printf("\t-V, --version       Print version and quit.\n");
                printf("\t-h, --help          Print this information and quit.\n");
                printf("Examples:\n");
                printf("\ttp0 < in.txt > out.txt\n");
                printf("\tcat in.txt | tp0 > out.txt\n");
                exit(0);
            break;

            case 'V' :
                printf("Tp0:Version_0.1:Grupo:\n");
                exit(0);
            break;
        }
    }

	matriz m_a;
	matriz m_b;
	int i,j;
    char* equis = ((char*)malloc(sizeof(char)));
	
	/* 	
	OTRAS VALIDACIONES:

	# Verificar si el archivo de entrada viene con una sola matriz.
	# Se pueda muliplicar las matrices, por ejemplo si las 2 matricez en el archivo de entrada son de 2 x2 verificar que hallan 4 elementos
	# verificar cuando el archivo viene mal formado, por ejemplo en vez de un numero viene un string
	# ver que termine bien cuando no hay memoria. si malloc=NULL entonces ver los mensajes de erorr por stderror (esto esta hecho, pero no lo probe).


	*/

    FILE * fp = stdin;
    
	/* se cargan los datos para las 2 matrices desde el archivo*/
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

    // hacer post validaciones

    if (m_a.cantCol != m_b.cantFil){
    	printf("\n\t\t ERROR:NO SE PUEDEN MULTIPLICAR LAS MATRICES DEBIDO A SUS DIMENSIONES");
    } else {
        // multipliacacion de la matriz
        matriz m_c;
        m_c.cantFil = m_a.cantFil;
        m_c.cantCol = m_b.cantCol;
        m_c.datos = ((double**)malloc(m_c.cantFil*sizeof(double*)));
        if (m_c.datos==NULL) {
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
        for(i=0;i<m_c.cantFil;i++) {
            free(m_c.datos[i]);
        }
        free(m_c.datos);

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


