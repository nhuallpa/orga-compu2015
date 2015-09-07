/**
*   6620 - Organizacion del computador 
*   Trabajo Practico 0 
*   Alumnos: 
*           88614 - Nestor Huallpa
*           88573 - Ariel Martinez
*           93194 - Facundo Caldora
*  - Validaciones de I/O y formato.
*  - Probar en el emulador y generar dump de assemble.
*  - Informe.
*/

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>

typedef struct {
       int cantFil;
       int cantCol;
       double** datos;
} matriz;

double** mallocMatrizDouble(int cantFila, int cantCol) 
{
    int i = 0;
    int k = 0;
    double** datos = ((double**)malloc(cantFila*sizeof(double*)));
    if (datos == NULL) 
    {
        return NULL;
    }
    else 
    {
        // Nuleamos array
        for (i=0; i<cantFila; i++)
        {
            datos[i] = NULL;       
        }

        for (i=0;i<cantFila;i++)
        {
            datos[i] = ((double*)malloc(cantCol*sizeof(double)));
            if (datos[i]==NULL)
            {
                // todo:liberamos toda memoria tomada hasta el momento
                for (k=0;k<cantFila;k++)
                {
                    if (datos[k] != NULL) {
                        free(datos[i]);    
                        datos[k] = NULL;
                    }
                }
                free(datos);
                datos = NULL;
                return NULL;
            }
        }
    }
    return datos;
}

void liberarMemoria(matriz* p_m)
{
    if (p_m != NULL) 
    {
        int i;
        for(i=0;i<(*p_m).cantFil;i++)
        {
            if ((*p_m).datos[i] != NULL) {
                free((*p_m).datos[i]);    
                (*p_m).datos[i] = NULL;
            }
        }
        free((*p_m).datos);
        (*p_m).datos=NULL;
    }
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
    m_a.datos = NULL;
	matriz m_b;
    m_b.datos = NULL;

	int i,j;
    
    FILE * fp = stdin;
    
	/* se cargan los datos para las 2 matrices desde el archivo*/
    while(!feof(fp))
    {
        // Se leen los valores desde el archivo de fila columna y separador de ambos
        if (fscanf(fp, "%dx%d" , &m_a.cantFil, &m_a.cantCol) == 0)
        {
            fprintf(stderr, "ERROR: AL LEER LA FILA O LA COLUMNA DE A\n");
            exit(1);
        }
      

        // Handlers de archivos mal ingresados
        if (m_a.cantFil<0){
            fprintf(stderr, "ERROR: FILA INGRESADA INVALIDA PARA MATRIZ A\n");
            exit(1);
        }
        if (m_a.cantCol<0){
            fprintf(stderr, "ERROR: COLUMNA INGRESADA INVALIDA PARA MATRIZ A\n");
            exit(1);
        }

        /* se aloja memoria para la matriz a */
        m_a.datos = mallocMatrizDouble(m_a.cantFil, m_a.cantCol);
        if (m_a.datos == NULL) {
            fprintf(stderr, "ERROR:MEMORIA INSUFICIENTE PARA MATRIZ A\n");
            exit(1);
        } 

        // Se cargan los datos de la matriz A
        for(i=0;i<m_a.cantFil;i++)
        {
            for(j=0;j<m_a.cantCol;j++)
            {
                if (fscanf(fp, "%lf", &m_a.datos[i][j]) == 0) 
                {
                    fprintf(stderr, "ERROR: ELEMENTO INCORRECTO EN LA MATRIZ\n");
                    liberarMemoria(&m_a);
                    exit(1);
                }
            }
        }


        // Se leen los valores desde el archivo de fila columna y separador de ambos
        if (fscanf(fp, "%dx%d" , &m_b.cantFil, &m_b.cantCol) == 0)
        {
            fprintf(stderr, "ERROR: AL LEER LA FILA O LA COLUMNA DE B\n");
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

        /* se aloja memoria para la matriz b */
        m_b.datos = mallocMatrizDouble(m_b.cantFil, m_b.cantCol);
        if (m_b.datos==NULL)
        {
            fprintf(stderr, "ERROR:MEMORIA INSUFICIENTE PARA MATRIZ B\n");
            liberarMemoria(&m_a);
            exit(1);
        }

        // Se cargan los datos de la matriz B
        for(i=0;i<m_b.cantFil;i++)
        {
            for(j=0;j<m_b.cantCol;j++)
            {
                if (fscanf(fp, "%lf", &m_b.datos[i][j]) == 0) 
                {
                    fprintf(stderr, "ERROR: ELEMENTO INCORRECTO EN LA MATRIZ\n");
                    liberarMemoria(&m_a);
                    liberarMemoria(&m_b);
                    exit(1);
                }
            }
        }

        // Hacer post validaciones

        if (m_a.cantCol != m_b.cantFil) 
        {
        	fprintf(stderr, "ERROR:NO SE PUEDEN MULTIPLICAR LAS MATRICES DEBIDO A SUS DIMENSIONES\n");
        } 
        else 
        {
            // multipliacacion de la matriz
            printf("%dX%d", m_a.cantFil, m_b.cantCol);
            int k = 0;
            double suma = 0.0;
            for (i=0; i<m_a.cantFil; i++) 
            {
                for (j=0; j<m_b.cantCol; j++) 
                {
                	suma = 0.0;
                    for (k=0; k<m_a.cantCol;k++) 
                    {
                        suma = suma + (m_a.datos[i][k] * m_b.datos[k][j]);
                    }
                    printf(" %4.2lf", suma);
                }
            }
            printf("\n");

        }
      
        liberarMemoria(&m_a);
        liberarMemoria(&m_b);

    }

    return 0;
}


