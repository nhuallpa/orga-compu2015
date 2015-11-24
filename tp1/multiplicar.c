void multiplicar(double* m_a_datos, double* m_b_datos, double* matriz_res, 
                    int m_a_cantFil, int m_a_cantCol, int m_b_cantCol) {
    int i,j,k = 0;
    int indiceA = 0;
    int indiceB = 0;
    int indiceC = 0;
    double suma = 0.0;

    for (i=0; i<m_a_cantFil; i++) 
    {
        for (j=0; j<m_b_cantCol; j++) 
        {
            suma = 0.0;
            for (k=0; k<m_a_cantCol;k++) 
            {
                indiceA = (i*m_a_cantCol) + k;
                indiceB = j + k*(m_b_cantCol);

                suma = suma + (m_a_datos[indiceA] * m_b_datos[indiceB]);
            }
            indiceC = i*m_b_cantCol + j;
            matriz_res[indiceC] = suma;
        }
    }
}