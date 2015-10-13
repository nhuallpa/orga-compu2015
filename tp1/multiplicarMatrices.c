
#include <stdio.h>
#include "multiplicarMatrices.h"

void multiplicarMatrices(double* m_a_datos, double* m_b_datos, int m_a_cantFil, int m_a_cantCol, int m_b_cantCol)
{

    printf("%dX%d", m_a_cantFil, m_b_cantCol);
    int i,j,k = 0;
    double suma = 0.0;
    for (i=0; i<m_a_cantFil; i++) 
    {
        for (j=0; j<m_b_cantCol; j++) 
        {
        	suma = 0.0;
            for (k=0; k<m_a_cantCol;k++) 
            {
                int indiceA = (i*m_a_cantCol) + k;
                int indiceB = j + k*(m_b_cantCol);

                suma = suma + (m_a_datos[indiceA] * m_b_datos[indiceB]);
            }
            printf(" %4.2lf", suma);
        }
    }
    printf("\n");
    
}


