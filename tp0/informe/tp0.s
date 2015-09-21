	.file	1 "main.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"%dX%d\000"
	.align	2
$LC1:
	.ascii	" %4.2lf\000"
	.align	2
$LC2:
	.ascii	"\n\000"
	.text
	.align	2
	.globl	imprimirMatriz
	.ent	imprimirMatriz
imprimirMatriz:
	.frame	$fp,48,$31		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$31,40($sp)
	sw	$fp,36($sp)
	sw	$28,32($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	lw	$2,48($fp)
	lw	$3,48($fp)
	la	$4,$LC0
	lw	$5,0($2)
	lw	$6,4($3)
	la	$25,printf
	jal	$31,$25
	sw	$0,24($fp)
$L18:
	lw	$2,48($fp)
	lw	$3,24($fp)
	lw	$2,0($2)
	slt	$2,$3,$2
	bne	$2,$0,$L21
	b	$L19
$L21:
	sw	$0,28($fp)
$L22:
	lw	$2,48($fp)
	lw	$3,28($fp)
	lw	$2,4($2)
	slt	$2,$3,$2
	bne	$2,$0,$L25
	b	$L20
$L25:
	lw	$4,48($fp)
	lw	$2,24($fp)
	sll	$3,$2,2
	lw	$2,8($4)
	addu	$4,$3,$2
	lw	$2,28($fp)
	sll	$3,$2,3
	lw	$2,0($4)
	addu	$2,$3,$2
	la	$4,$LC1
	lw	$6,0($2)
	lw	$7,4($2)
	la	$25,printf
	jal	$31,$25
	lw	$2,28($fp)
	addu	$2,$2,1
	sw	$2,28($fp)
	b	$L22
$L20:
	lw	$2,24($fp)
	addu	$2,$2,1
	sw	$2,24($fp)
	b	$L18
$L19:
	la	$4,$LC2
	la	$25,printf
	jal	$31,$25
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
	.end	imprimirMatriz
	.size	imprimirMatriz, .-imprimirMatriz
	.align	2
	.globl	liberarMemoria
	.ent	liberarMemoria
liberarMemoria:
	.frame	$fp,48,$31		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$31,40($sp)
	sw	$fp,36($sp)
	sw	$28,32($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	sw	$0,24($fp)
$L27:
	lw	$2,48($fp)
	lw	$3,24($fp)
	lw	$2,0($2)
	slt	$2,$3,$2
	bne	$2,$0,$L30
	b	$L28
$L30:
	lw	$4,48($fp)
	lw	$2,24($fp)
	sll	$3,$2,2
	lw	$2,8($4)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$25,free
	jal	$31,$25
	lw	$2,24($fp)
	addu	$2,$2,1
	sw	$2,24($fp)
	b	$L27
$L28:
	lw	$2,48($fp)
	lw	$4,8($2)
	la	$25,free
	jal	$31,$25
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
	.end	liberarMemoria
	.size	liberarMemoria, .-liberarMemoria
	.rdata
	.align	2
$LC4:
	.ascii	"help\000"
	.align	2
$LC5:
	.ascii	"version\000"
	.data
	.align	2
$LC6:
	.word	$LC4
	.word	0
	.word	0
	.word	104
	.word	$LC5
	.word	0
	.word	0
	.word	86
	.word	0
	.word	0
	.word	0
	.word	0
	.globl	memcpy
	.rdata
	.align	2
$LC3:
	.ascii	"hV\000"
	.align	2
$LC7:
	.ascii	"Usage:\n\000"
	.align	2
$LC8:
	.ascii	"\ttp0 -h\n\000"
	.align	2
$LC9:
	.ascii	"\ttp0 -V\n\000"
	.align	2
$LC10:
	.ascii	"\ttp0 < in_file > out_file\n\000"
	.align	2
$LC11:
	.ascii	"Options:\n\000"
	.align	2
$LC12:
	.ascii	"\t-V, --version       Print version and quit.\n\000"
	.align	2
$LC13:
	.ascii	"\t-h, --help          Print this information and quit.\n"
	.ascii	"\000"
	.align	2
$LC14:
	.ascii	"Examples:\n\000"
	.align	2
$LC15:
	.ascii	"\ttp0 < in.txt > out.txt\n\000"
	.align	2
$LC16:
	.ascii	"\tcat in.txt | tp0 > out.txt\n\000"
	.align	2
$LC17:
	.ascii	"Tp0:Version_0.1:Grupo:\n\000"
	.align	2
$LC18:
	.ascii	"%d\000"
	.align	2
$LC19:
	.ascii	"%c\000"
	.align	2
$LC20:
	.ascii	"\n"
	.ascii	"\t\tERROR: FILA INGRESADA INVALIDA PARA MATRIZ A\000"
	.align	2
$LC21:
	.ascii	"\n"
	.ascii	"\t\tERROR: COLUMNA INGRESADA INVALIDA PARA MATRIZ A\000"
	.align	2
$LC22:
	.ascii	"\n"
	.ascii	"\t\tERROR:MEMORIA INSUFICIENTE PARA MATRIZ A\000"
	.align	2
$LC23:
	.ascii	"%lf\000"
	.align	2
$LC24:
	.ascii	"\n"
	.ascii	"\t\tERROR: FILA INGRESADA INVALIDA PARA MATRIZ B\000"
	.align	2
$LC25:
	.ascii	"\n"
	.ascii	"\t\tERROR: COLUMNA INGRESADA INVALIDA PARA MATRIZ B\000"
	.align	2
$LC26:
	.ascii	"\n"
	.ascii	"\t\tERROR:MEMORIA INSUFICIENTE PARA MATRIZ B\000"
	.align	2
$LC27:
	.ascii	"\n"
	.ascii	"\t\t ERROR:NO SE PUEDEN MULTIPLICAR LAS MATRICES DEBIDO "
	.ascii	"A SUS DIMENSIONES\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,192,$31		# vars= 144, regs= 4/0, args= 24, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,192
	.cprestore 24
	sw	$31,188($sp)
	sw	$fp,184($sp)
	sw	$28,180($sp)
	sw	$16,176($sp)
	move	$fp,$sp
	sw	$4,192($fp)
	sw	$5,196($fp)
	la	$2,$LC3
	sw	$2,36($fp)
	addu	$2,$fp,40
	la	$3,$LC6
	move	$4,$2
	move	$5,$3
	li	$6,48			# 0x30
	la	$25,memcpy
	jal	$31,$25
$L32:
	addu	$2,$fp,40
	sw	$0,16($sp)
	lw	$4,192($fp)
	lw	$5,196($fp)
	lw	$6,36($fp)
	move	$7,$2
	la	$25,getopt_long
	jal	$31,$25
	sw	$2,32($fp)
	lw	$3,32($fp)
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L35
	b	$L33
$L35:
	lw	$2,32($fp)
	sw	$2,168($fp)
	li	$2,86			# 0x56
	lw	$3,168($fp)
	beq	$3,$2,$L38
	li	$2,104			# 0x68
	lw	$3,168($fp)
	beq	$3,$2,$L37
	b	$L32
$L37:
	la	$4,$LC7
	la	$25,printf
	jal	$31,$25
	la	$4,$LC8
	la	$25,printf
	jal	$31,$25
	la	$4,$LC9
	la	$25,printf
	jal	$31,$25
	la	$4,$LC10
	la	$25,printf
	jal	$31,$25
	la	$4,$LC11
	la	$25,printf
	jal	$31,$25
	la	$4,$LC12
	la	$25,printf
	jal	$31,$25
	la	$4,$LC13
	la	$25,printf
	jal	$31,$25
	la	$4,$LC14
	la	$25,printf
	jal	$31,$25
	la	$4,$LC15
	la	$25,printf
	jal	$31,$25
	la	$4,$LC16
	la	$25,printf
	jal	$31,$25
	move	$4,$0
	la	$25,exit
	jal	$31,$25
$L38:
	la	$4,$LC17
	la	$25,printf
	jal	$31,$25
	move	$4,$0
	la	$25,exit
	jal	$31,$25
$L33:
	li	$4,1			# 0x1
	la	$25,malloc
	jal	$31,$25
	sw	$2,128($fp)
	la	$2,__sF
	sw	$2,132($fp)
$L41:
	lw	$2,132($fp)
	lhu	$2,12($2)
	srl	$2,$2,5
	andi	$2,$2,0x1
	beq	$2,$0,$L43
	b	$L42
$L43:
	addu	$2,$fp,88
	lw	$4,132($fp)
	la	$5,$LC18
	move	$6,$2
	la	$25,fscanf
	jal	$31,$25
	lw	$2,132($fp)
	lhu	$2,12($2)
	srl	$2,$2,5
	andi	$2,$2,0x1
	beq	$2,$0,$L44
	b	$L42
$L44:
	lw	$4,132($fp)
	la	$5,$LC19
	lw	$6,128($fp)
	la	$25,fscanf
	jal	$31,$25
	addu	$2,$fp,88
	addu	$2,$2,4
	lw	$4,132($fp)
	la	$5,$LC18
	move	$6,$2
	la	$25,fscanf
	jal	$31,$25
	lw	$2,88($fp)
	bgez	$2,$L45
	la	$4,$LC20
	la	$25,printf
	jal	$31,$25
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L45:
	lw	$2,92($fp)
	bgez	$2,$L46
	la	$4,$LC21
	la	$25,printf
	jal	$31,$25
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L46:
	lw	$2,88($fp)
	sll	$2,$2,2
	move	$4,$2
	la	$25,malloc
	jal	$31,$25
	sw	$2,96($fp)
	lw	$2,96($fp)
	bne	$2,$0,$L47
	la	$4,$LC22
	la	$25,printf
	jal	$31,$25
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L47:
	sw	$0,120($fp)
$L48:
	lw	$2,120($fp)
	lw	$3,88($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L51
	b	$L49
$L51:
	lw	$2,120($fp)
	sll	$3,$2,2
	lw	$2,96($fp)
	addu	$16,$3,$2
	lw	$2,92($fp)
	sll	$2,$2,3
	move	$4,$2
	la	$25,malloc
	jal	$31,$25
	sw	$2,0($16)
	lw	$2,120($fp)
	sll	$3,$2,2
	lw	$2,96($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	bne	$2,$0,$L50
	la	$4,$LC22
	la	$25,printf
	jal	$31,$25
	li	$4,-1			# 0xffffffffffffffff
	la	$25,exit
	jal	$31,$25
$L50:
	lw	$2,120($fp)
	addu	$2,$2,1
	sw	$2,120($fp)
	b	$L48
$L49:
	sw	$0,120($fp)
$L53:
	lw	$2,120($fp)
	lw	$3,88($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L56
	b	$L54
$L56:
	sw	$0,124($fp)
$L57:
	lw	$2,124($fp)
	lw	$3,92($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L60
	b	$L55
$L60:
	lw	$2,120($fp)
	sll	$3,$2,2
	lw	$2,96($fp)
	addu	$4,$3,$2
	lw	$2,124($fp)
	sll	$3,$2,3
	lw	$2,0($4)
	addu	$2,$3,$2
	lw	$4,132($fp)
	la	$5,$LC23
	move	$6,$2
	la	$25,fscanf
	jal	$31,$25
	lw	$2,124($fp)
	addu	$2,$2,1
	sw	$2,124($fp)
	b	$L57
$L55:
	lw	$2,120($fp)
	addu	$2,$2,1
	sw	$2,120($fp)
	b	$L53
$L54:
	addu	$2,$fp,104
	lw	$4,132($fp)
	la	$5,$LC18
	move	$6,$2
	la	$25,fscanf
	jal	$31,$25
	lw	$4,132($fp)
	la	$5,$LC19
	lw	$6,128($fp)
	la	$25,fscanf
	jal	$31,$25
	addu	$2,$fp,104
	addu	$2,$2,4
	lw	$4,132($fp)
	la	$5,$LC18
	move	$6,$2
	la	$25,fscanf
	jal	$31,$25
	lw	$2,104($fp)
	bgez	$2,$L61
	la	$4,$LC24
	la	$25,printf
	jal	$31,$25
	addu	$2,$fp,88
	move	$4,$2
	la	$25,liberarMemoria
	jal	$31,$25
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L61:
	lw	$2,108($fp)
	bgez	$2,$L62
	la	$4,$LC25
	la	$25,printf
	jal	$31,$25
	addu	$2,$fp,88
	move	$4,$2
	la	$25,liberarMemoria
	jal	$31,$25
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L62:
	lw	$2,104($fp)
	sll	$2,$2,2
	move	$4,$2
	la	$25,malloc
	jal	$31,$25
	sw	$2,112($fp)
	lw	$2,112($fp)
	bne	$2,$0,$L63
	la	$4,$LC26
	la	$25,printf
	jal	$31,$25
	addu	$2,$fp,88
	move	$4,$2
	la	$25,liberarMemoria
	jal	$31,$25
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L63:
	sw	$0,120($fp)
$L64:
	lw	$2,120($fp)
	lw	$3,104($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L67
	b	$L65
$L67:
	lw	$2,120($fp)
	sll	$3,$2,2
	lw	$2,112($fp)
	addu	$16,$3,$2
	lw	$2,108($fp)
	sll	$2,$2,3
	move	$4,$2
	la	$25,malloc
	jal	$31,$25
	sw	$2,0($16)
	lw	$2,120($fp)
	sll	$3,$2,2
	lw	$2,112($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	bne	$2,$0,$L66
	la	$4,$LC26
	la	$25,printf
	jal	$31,$25
	addu	$2,$fp,88
	move	$4,$2
	la	$25,liberarMemoria
	jal	$31,$25
	li	$4,-1			# 0xffffffffffffffff
	la	$25,exit
	jal	$31,$25
$L66:
	lw	$2,120($fp)
	addu	$2,$2,1
	sw	$2,120($fp)
	b	$L64
$L65:
	sw	$0,120($fp)
$L69:
	lw	$2,120($fp)
	lw	$3,104($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L72
	b	$L70
$L72:
	sw	$0,124($fp)
$L73:
	lw	$2,124($fp)
	lw	$3,108($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L76
	b	$L71
$L76:
	lw	$2,120($fp)
	sll	$3,$2,2
	lw	$2,112($fp)
	addu	$4,$3,$2
	lw	$2,124($fp)
	sll	$3,$2,3
	lw	$2,0($4)
	addu	$2,$3,$2
	lw	$4,132($fp)
	la	$5,$LC23
	move	$6,$2
	la	$25,fscanf
	jal	$31,$25
	lw	$2,124($fp)
	addu	$2,$2,1
	sw	$2,124($fp)
	b	$L73
$L71:
	lw	$2,120($fp)
	addu	$2,$2,1
	sw	$2,120($fp)
	b	$L69
$L70:
	addu	$2,$fp,88
	move	$4,$2
	la	$25,imprimirMatriz
	jal	$31,$25
	addu	$2,$fp,104
	move	$4,$2
	la	$25,imprimirMatriz
	jal	$31,$25
	lw	$3,92($fp)
	lw	$2,104($fp)
	beq	$3,$2,$L77
	la	$4,$LC27
	la	$25,printf
	jal	$31,$25
	b	$L78
$L77:
	lw	$2,88($fp)
	sw	$2,136($fp)
	lw	$2,108($fp)
	sw	$2,140($fp)
	lw	$2,136($fp)
	sll	$2,$2,2
	move	$4,$2
	la	$25,malloc
	jal	$31,$25
	sw	$2,144($fp)
	lw	$2,144($fp)
	bne	$2,$0,$L79
	la	$4,$LC22
	la	$25,printf
	jal	$31,$25
	addu	$2,$fp,88
	move	$4,$2
	la	$25,liberarMemoria
	jal	$31,$25
	addu	$2,$fp,104
	move	$4,$2
	la	$25,liberarMemoria
	jal	$31,$25
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L79:
	sw	$0,120($fp)
$L80:
	lw	$2,120($fp)
	lw	$3,136($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L83
	b	$L81
$L83:
	lw	$2,120($fp)
	sll	$3,$2,2
	lw	$2,144($fp)
	addu	$16,$3,$2
	lw	$2,140($fp)
	sll	$2,$2,3
	move	$4,$2
	la	$25,malloc
	jal	$31,$25
	sw	$2,0($16)
	lw	$2,120($fp)
	sll	$3,$2,2
	lw	$2,144($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	bne	$2,$0,$L82
	la	$4,$LC22
	la	$25,printf
	jal	$31,$25
	addu	$2,$fp,88
	move	$4,$2
	la	$25,liberarMemoria
	jal	$31,$25
	addu	$2,$fp,104
	move	$4,$2
	la	$25,liberarMemoria
	jal	$31,$25
	li	$4,-1			# 0xffffffffffffffff
	la	$25,exit
	jal	$31,$25
$L82:
	lw	$2,120($fp)
	addu	$2,$2,1
	sw	$2,120($fp)
	b	$L80
$L81:
	sw	$0,152($fp)
	sw	$0,160($fp)
	sw	$0,164($fp)
	sw	$0,120($fp)
$L85:
	lw	$2,120($fp)
	lw	$3,136($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L88
	b	$L86
$L88:
	sw	$0,124($fp)
$L89:
	lw	$2,124($fp)
	lw	$3,140($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L92
	b	$L87
$L92:
	sw	$0,160($fp)
	sw	$0,164($fp)
	sw	$0,152($fp)
$L93:
	lw	$2,152($fp)
	lw	$3,92($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L96
	b	$L94
$L96:
	lw	$2,120($fp)
	sll	$3,$2,2
	lw	$2,96($fp)
	addu	$4,$3,$2
	lw	$2,152($fp)
	sll	$3,$2,3
	lw	$2,0($4)
	addu	$5,$3,$2
	lw	$2,152($fp)
	sll	$3,$2,2
	lw	$2,112($fp)
	addu	$4,$3,$2
	lw	$2,124($fp)
	sll	$3,$2,3
	lw	$2,0($4)
	addu	$2,$3,$2
	l.d	$f2,0($5)
	l.d	$f0,0($2)
	mul.d	$f2,$f2,$f0
	l.d	$f0,160($fp)
	add.d	$f0,$f0,$f2
	s.d	$f0,160($fp)
	lw	$2,152($fp)
	addu	$2,$2,1
	sw	$2,152($fp)
	b	$L93
$L94:
	lw	$2,120($fp)
	sll	$3,$2,2
	lw	$2,144($fp)
	addu	$4,$3,$2
	lw	$2,124($fp)
	sll	$3,$2,3
	lw	$2,0($4)
	addu	$2,$3,$2
	l.d	$f0,160($fp)
	s.d	$f0,0($2)
	lw	$2,124($fp)
	addu	$2,$2,1
	sw	$2,124($fp)
	b	$L89
$L87:
	lw	$2,120($fp)
	addu	$2,$2,1
	sw	$2,120($fp)
	b	$L85
$L86:
	addu	$2,$fp,136
	move	$4,$2
	la	$25,imprimirMatriz
	jal	$31,$25
	addu	$2,$fp,136
	move	$4,$2
	la	$25,liberarMemoria
	jal	$31,$25
$L78:
	addu	$2,$fp,88
	move	$4,$2
	la	$25,liberarMemoria
	jal	$31,$25
	addu	$2,$fp,104
	move	$4,$2
	la	$25,liberarMemoria
	jal	$31,$25
	b	$L41
$L42:
	lw	$4,128($fp)
	la	$25,free
	jal	$31,$25
	move	$2,$0
	move	$sp,$fp
	lw	$31,188($sp)
	lw	$fp,184($sp)
	lw	$16,176($sp)
	addu	$sp,$sp,192
	j	$31
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
