
#include <mips/regdef.h>

	.text
	.align 		2
	.global		multiplicar
	.ent		multiplicar
multiplicar:
	.frame	$fp,56,ra
	.set	noreorder
	.cpload	t9
	.set	reorder

	subu    sp,sp,56
	sw      $fp,48(sp)
	sw      gp,52(sp)
	move    $fp,sp
	sw      a0,56($fp)	#Guardo parametros
	sw	    a1,60($fp)
	sw      a2,64($fp)
	sw      a3,68($fp)
	sw      a2,16($fp)
	li      t0,0
	sw      t0,20($fp)	#i=0
	li      t0,0
	sw      t0,24($fp)	#j=0
	li      t0,0
	sw      t0,28($fp)	#k=0
	li      t0,0
	sw      t0,32($fp)	#indiceA=0
	li      t0,0
	sw      t0,36($fp)	#indiceB=0
	li      t0,0
	sw      t0,40($fp)	#indiceC=0

fori:
	lw      t0,20($fp)	#t0=i
	lw      t1,68($fp)	#t1=m_a_cantFil
	bge     t0,t1,retornar
	li      t0,0
	sw      t0,24($fp)	#j=0

forj:	
	lw      t0,24($fp)	#t0=j
	lw      t1,76($fp)	#t1=m_b_cantFil
	bge     t0,t1,nexti
	li      t0,0
	sw      t0,28($fp)	#k=0
	li.d    $f0,0.0		#suma=0.0

fork:
	lw      t0,28($fp)	#t0=k
	lw      t1,72($fp)	#t1=m_a_cantCol
	bge     t0,t1,nextj

	lw      t2,20($fp)	#t2=i
	lw      t3,72($fp)	#t1=m_a_cantCol
	mul     t2,t2,t3	#t2=i*m_a_cantCol
	lw      t4,28($fp)	#t4=k
	addu    t2,t2,t4	#t2=i*m_a_cantCol + k
	sw      t2,32($fp)	#indiceA = i*m_a_cantCol + k

	lw      t2,28($fp)	#t2=k
	lw      t3,76($fp)	#t3=m_b_cantCol
	mul     t2,t2,t3	#t2=k*m_b_cantCol
	lw      t4,24($fp)	#t4=j
	addu    t2,t2,t4	#t2=j+k*m_b_cantCol
	sw      t2,36($fp)	#indiceB=j+k*m_b_cantCol

	lw      t2,56($fp)	#t2=m_a_datos
	lw      t3,32($fp)	#t3=indiceA
	sll     t3,t3,3 		
	addu    t4,t3,t2	#t4=&m_a_datos[indiceA]

	lw      t5,60($fp)	#t5=m_b_datos
	lw      t6,36($fp)	#t6=indiceB
	sll     t6,t6,3
	addu    t7,t6,t5	#t7=&m_b_datos[indiceB]

	l.d     $f2,0(t4)	#f2=m_a_datos[indiceA]
	l.d     $f4,0(t7)	#f4=m_b_datos[indiceB]
	mul.d   $f2,$f2,$f4	#f2=m_a_datos[indiceA]*m_b_datos[indiceB]
	add.d   $f0,$f0,$f2	#f0=suma+m_a_datos[indiceA]*m_b_datos[indiceB]

nextk:
	lw      t0,28($fp)	#t0=k
	addiu   t0,t0,1     #t0=k+1
	sw      t0,28($fp)		
	j       fork

nextj:
	lw      t2,20($fp)	#t2=i
	lw      t3,76($fp)	#t3=m_b_cantCol
	mul     t2,t2,t3	#t2=i*m_b_cantCol
	lw      t3,24($fp)	#t3=j
	addu    t2,t2,t3	#t2=i*m_b_cantCol+j
	sw      t2,40($fp)	#indiceC=i*m_b_cantCol+j
	
	lw      t2,64($fp)	#t2=matriz_res
	lw      t3,40($fp)	#t3=indiceC
	sll     t3,t3,3
	addu    t4,t3,t2	#t4=&matriz_res[indiceC]
	s.d     $f0,0(t4)	#matriz_res[indiceC]=suma

	lw      t0,24($fp)	#t0=j
	addiu   t0,t0,1 	#t0=j+1
	sw      t0,24($fp)		
	j       forj

nexti:
	lw      t0,20($fp)	#t0=i
	addiu   t0,t0,1     #t0=i+1
	sw      t0,20($fp)		
	j       fori

retornar:
	move    sp,$fp
	lw      $fp,48(sp)
	lw      gp,52(sp)
	addu    sp,sp,56
	j       ra
	.end    multiplicar

