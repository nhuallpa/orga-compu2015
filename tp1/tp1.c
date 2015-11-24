/**
*   6620 - Organizacion del computador 
*   Trabajo Practico 1 
*   Alumnos: 
*           88614 - Nestor Huallpa
*           88573 - Ariel Martinez
*/

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>

#define cod_test_04 4;
#define cod_test_05 5;
#define cod_test_06 6;
#define cod_test_07 7;
#define cod_test_08 8;
#define cod_test_09 9;
#define cod_test_10 10;  

typedef struct {
       int cantFil;
       int cantCol;
       double* datos;
} matriz;


extern void multiplicar(double* m_a_datos, double* m_b_datos, double* matriz_res, 
                    int m_a_cantFil, int m_a_cantCol, int m_b_cantCol);

/**
* Imprime cada elemento de array por stdout
*/
void imprimirElementos(double* arreglo, int n)
{
    int i=0;
    for (i=0; i<n; i++) {
        double elemento = arreglo[i];
        printf(" %4.2lf", elemento);
    }
}

int multiplicarMatrices(matriz* m_a, matriz* m_b)
{
    int m_a_cantFil = (*m_a).cantFil;
    int m_b_cantCol = (*m_b).cantCol;

    double* matriz_resultado = ((double*)malloc(m_a_cantFil*m_b_cantCol*sizeof(double)));
    if (matriz_resultado == NULL) {
        return 1;
    }

    printf("%dX%d", m_a_cantFil, m_b_cantCol);
    multiplicar((*m_a).datos, (*m_b).datos, matriz_resultado, (*m_a).cantFil, (*m_a).cantCol, (*m_b).cantCol);
    imprimirElementos(matriz_resultado, m_a_cantFil*m_b_cantCol);
    free(matriz_resultado);
    printf("\n");
    return 0;
}


double* mallocMatrizDouble(int cantFila, int cantCol) 
{
    int i;
    double* datos = ((double*)malloc(cantFila*cantCol*sizeof(double)));
    if (datos == NULL) 
    {
        return NULL;
    }
    else 
    {
        for (i=0; i<cantFila*cantCol; i++)
        {
            datos[i] = 0.0;       
        }
    }
    return datos;
}

void liberarMemoria(matriz* p_m)
{
    if (p_m != NULL) 
    {
        free((*p_m).datos);
        (*p_m).datos=NULL;
    }
}

void manejarArgumentosEntrada(int argc, char** argv)
{
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

}

int main(int argc, char** argv) {

	manejarArgumentosEntrada(argc, argv);

	matriz m_a;
	matriz m_b;
	int i,j;
    char dato;
    FILE * fp = stdin;

    while(!feof(fp))
    {
        m_a.cantFil = 0;
        m_a.cantCol = 0;
        m_b.cantFil = 0;
        m_b.cantCol = 0;
    
        if (fscanf(fp, "%dx%d" , &m_a.cantFil, &m_a.cantCol) == 0){
            fprintf(stderr, "formato invalido para fila y/o la columna de A\n");
            exit(5);
        }

        if (m_a.cantFil==0 || m_a.cantCol == 0){
            fprintf(stderr, "A no ingresada o se detecto una linea vacia en el archivo\n" );
            exit(1);
        }
        
        m_a.datos = mallocMatrizDouble(m_a.cantFil, m_a.cantCol);
        if (m_a.datos == NULL) {
            fprintf(stderr, "memoria insuficiente para A\n");
            exit(10);
        } 

        for(i=0;i<m_a.cantFil;i++)
        {
            for(j=0;j<m_a.cantCol;j++)
            {
                if ( (dato = fgetc(fp)) == '\n'){
                    fprintf(stderr, "faltan elementos de A\n" );
                    liberarMemoria(&m_a);
                    exit(9);
                }
                if (fscanf(fp, "%lf", &m_a.datos[(i*m_a.cantCol) + j]) == 0) 
                {
                    fprintf(stderr, "formato invalido para elemento de A\n");
                    liberarMemoria(&m_a);
                    exit(5);
                }
            }
        }

        if (fscanf(fp, "%dx%d" , &m_b.cantFil, &m_b.cantCol) == 0)
        {
			fprintf(stderr, "formato invalido para fila y/o la columna de A\n");
            liberarMemoria(&m_a);
            exit(5);
        }


        if (m_b.cantFil==0 || m_b.cantCol == 0){
            fprintf(stderr, "no se ingreso B\n" );
            liberarMemoria(&m_a);
            exit(7);
        }
        
        /* se aloja memoria para la matriz b */
        m_b.datos = mallocMatrizDouble(m_b.cantFil, m_b.cantCol);
        if (m_b.datos==NULL)
        {
            fprintf(stderr, "memoria insuficiente para B\n");
            liberarMemoria(&m_a);
            exit(10);
        }

    
        for(i=0;i<m_b.cantFil;i++)
        {
            for(j=0;j<m_b.cantCol;j++)
            {
                if( (dato = fgetc(fp)) == '\n'){
                    fprintf(stderr, "faltan elementos en B\n" );
                    liberarMemoria(&m_a);
                    liberarMemoria(&m_b);
                    exit(8);
                }
                if (fscanf(fp, "%lf", &m_b.datos[(i*m_b.cantCol) + j]) == 0) 
                {
                    fprintf(stderr, "formato invalido para elemento de B\n");
                    liberarMemoria(&m_a);
                    liberarMemoria(&m_b);
                    exit(6);
                }
            }
        }
			
        if (m_a.cantCol != m_b.cantFil) 
        {
        	fprintf(stderr, "dimensiones invalidas para la multiplicacion\n" );
            liberarMemoria(&m_a);
            liberarMemoria(&m_b);
            exit(4);
        } 
        else 
        {
            if (multiplicarMatrices(&m_a, &m_b) != 0) {
                fprintf(stderr, "memoria insuficiente para A\n");
                liberarMemoria(&m_a);
                liberarMemoria(&m_b);
                exit(10);      
            }

        }
      
        liberarMemoria(&m_a);
        liberarMemoria(&m_b);
    }
	
    return 0;
}



