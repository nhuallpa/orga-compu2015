#ifndef _MULTIPLICARMATRIZ_H_
#define _MULTIPLICARMATRIZ_H_

/*
	El primer y segundo parametro tienen las matricez a multiplicar. Los siguientes dos, tiene 
	@m_a_datos primera matriz para multiplicar
	@m_b_datos segunda matriz para multiplicar
	@m_a_cantFil cantidad de filas de la primer matriz
	@m_a_cantCol cantidad de columnas de la primer matriz
	@m_b_cantCol cantidad de columnas de la segunda matriz
*/

extern void multiplicarMatrices(double* m_a_datos, double* m_b_datos, int m_a_cantFil, int m_a_cantCol, int m_b_cantCol);

#endif
