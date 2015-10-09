/**
*   6620 - Organizacion del computador 
*   Trabajo Practico 0 
*   Alumnos: 
*           88614 - Nestor Huallpa
*           88573 - Ariel Martinez
*           93194 - Facundo Caldora
*/

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>

typedef struct {
       int cantFil;
       int cantCol;
       double* datos;
} matriz;

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



void multiplicarMatrices(matriz m_a, matriz m_b)
{

    printf("%dX%d", m_a.cantFil, m_b.cantCol);
    int i,j,k = 0;
    double suma = 0.0;
    for (i=0; i<m_a.cantFil; i++) 
    {
        for (j=0; j<m_b.cantCol; j++) 
        {
        	suma = 0.0;
            for (k=0; k<m_a.cantCol;k++) 
            {
                int indiceA = (i*m_a.cantCol) + k;
                int indiceB = j + k*(m_b.cantCol);

                suma = suma + (m_a.datos[indiceA] * m_b.datos[indiceB]);
            }
            printf(" %4.2lf", suma);
        }
    }
    printf("\n");
    
}

int main(int argc, char** argv) {

	manejarArgumentosEntrada(argc, argv);

	matriz m_a;
	matriz m_b;
	int i,j;
    char dato;
    FILE * fp = stdin;
    
	/* se cargan los datos para las 2 matrices desde el archivo*/
    while(!feof(fp))
    {
    
        m_a.cantFil = 0;
        m_a.cantCol = 0;
        m_b.cantFil = 0;
        m_b.cantCol = 0;
    
        /*Se leen los valores desde el archivo de fila columna y separador de ambos*/
        if (fscanf(fp, "%dx%d" , &m_a.cantFil, &m_a.cantCol) == 0)
        {
            fprintf(stderr, "ERROR: AL LEER LA FILA O LA COLUMNA DE A\n");
            exit(1);
        }
        /* Handlers de archivos mal ingresados */
        if (m_a.cantFil<0){
            fprintf(stderr, "ERROR: FILA INGRESADA INVALIDA PARA MATRIZ A\n");
            exit(1);
        }
        if (m_a.cantCol<0){
            fprintf(stderr, "ERROR: COLUMNA INGRESADA INVALIDA PARA MATRIZ A\n");
            exit(1);
        }
        if (m_a.cantFil==0 || m_a.cantCol == 0){
            fprintf(stderr, "ERROR: MATRIZ A NO INGRESADA O ESPACIO DE MAS EN EL ARCHIVO\n" );
            exit(1);
        }
        /* se aloja memoria para la matriz a */
        m_a.datos = mallocMatrizDouble(m_a.cantFil, m_a.cantCol);
        if (m_a.datos == NULL) {
            fprintf(stderr, "ERROR:MEMORIA INSUFICIENTE PARA MATRIZ A\n");
            exit(1);
        } 

        for(i=0;i<m_a.cantFil;i++)
        {
            for(j=0;j<m_a.cantCol;j++)
            {
                int indice = (i*m_a.cantCol) + j;

                if ( (dato = fgetc(fp)) == '\n'){
                    fprintf(stderr, "ERROR: FALTAN ELEMENTOS EN MATRIZ A\n" );
                    liberarMemoria(&m_a);
                    exit(1);
                }
                if (fscanf(fp, "%lf", &m_a.datos[indice]) == 0) 
                {
                    fprintf(stderr, "ERROR: ELEMENTO INCORRECTO EN LA MATRIZ A\n");
                    liberarMemoria(&m_a);
                    exit(1);
                }
            }
        }

        if (fscanf(fp, "%dx%d" , &m_b.cantFil, &m_b.cantCol) == 0)
        {
            fprintf(stderr, "ERROR: AL LEER LA FILA O LA COLUMNA DE B\n");
            liberarMemoria(&m_a);
            exit(1);
        }

        if (m_b.cantFil<0)
        {
            fprintf(stderr, "ERROR: FILA INGRESADA INVALIDA PARA MATRIZ B\n");
            liberarMemoria(&m_a);
            exit(1);
        }
        if (m_b.cantCol<0)
        {
            fprintf(stderr, "ERROR: COLUMNA INGRESADA INVALIDA PARA MATRIZ B\n");
            liberarMemoria(&m_a);
            exit(1);
        }

        if (m_b.cantFil==0 || m_b.cantCol == 0){
            fprintf(stderr, "ERROR: MATRIZ B NO INGRESADA \n" );
            liberarMemoria(&m_a);
            exit(1);
        }
        
        /* se aloja memoria para la matriz b */
        m_b.datos = mallocMatrizDouble(m_b.cantFil, m_b.cantCol);
        if (m_b.datos==NULL)
        {
            fprintf(stderr, "ERROR:MEMORIA INSUFICIENTE PARA MATRIZ B\n");
            liberarMemoria(&m_a);
            exit(1);
        }

    
        for(i=0;i<m_b.cantFil;i++)
        {
            for(j=0;j<m_b.cantCol;j++)
            {
                int indice = (i*m_b.cantCol) + j;
                if( (dato = fgetc(fp)) == '\n'){
                    fprintf(stderr, "ERROR: FALTAN ELEMENTOS EN MATRIZ B\n" );
                    liberarMemoria(&m_a);
                    liberarMemoria(&m_b);
                    exit(1);
                }
                if (fscanf(fp, "%lf", &m_b.datos[indice]) == 0) 
                {
                    fprintf(stderr, "ERROR: ELEMENTO INCORRECTO EN LA MATRIZ B\n");
                    liberarMemoria(&m_a);
                    liberarMemoria(&m_b);
                    exit(1);
                }
            }
        }

        if (m_a.cantCol != m_b.cantFil) 
        {
        	fprintf(stderr, "ERROR:NO SE PUEDEN MULTIPLICAR LAS MATRICES DEBIDO A SUS DIMENSIONES\n");
            liberarMemoria(&m_a);
            liberarMemoria(&m_b);
            exit(1);
        } 
        else 
        {
			multiplicarMatrices(m_a, m_b);
        }
      
        liberarMemoria(&m_a);
        liberarMemoria(&m_b);
    }

    return 0;
}


