	.file	1 "Process_File.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"%c\000"
	.align	2
$LC1:
	.ascii	"\n\000"
	.text
	.align	2
	.globl	Imprimir_Linea
	.ent	Imprimir_Linea
Imprimir_Linea:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$zero,28($fp)
	lw	$v0,56($fp)
	lw	$v1,56($fp)
	lw	$a0,0($v0)
	lw	$v0,4($v1)
	subu	$v0,$a0,$v0
	sw	$v0,32($fp)
	lw	$v0,32($fp)
	beq	$v0,$zero,$L18
	lw	$v0,56($fp)
	lw	$v1,56($fp)
	lw	$a0,12($v0)
	lw	$a1,4($v1)
	move	$a2,$zero
	la	$t9,fseek
	jal	$ra,$t9
	sw	$zero,28($fp)
$L19:
	lw	$v0,28($fp)
	lw	$v1,32($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L22
	b	$L20
$L22:
	lw	$v0,56($fp)
	addu	$a0,$fp,24
	li	$a1,1			# 0x1
	li	$a2,1			# 0x1
	lw	$a3,12($v0)
	la	$t9,fread
	jal	$ra,$t9
	lb	$v1,24($fp)
	li	$v0,10			# 0xa
	beq	$v1,$v0,$L21
	lb	$v0,24($fp)
	la	$a0,$LC0
	move	$a1,$v0
	la	$t9,printf
	jal	$ra,$t9
$L21:
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L19
$L20:
	la	$a0,$LC1
	la	$t9,printf
	jal	$ra,$t9
	lw	$v0,56($fp)
	lw	$v1,56($fp)
	lw	$a0,12($v0)
	lw	$a1,4($v1)
	move	$a2,$zero
	la	$t9,fseek
	jal	$ra,$t9
$L18:
	lw	$v0,56($fp)
	lw	$v1,56($fp)
	lw	$v1,4($v1)
	sw	$v1,0($v0)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	Imprimir_Linea
	.size	Imprimir_Linea, .-Imprimir_Linea
	.align	2
	.globl	Identificar_Linea_e_Imprimir
	.ent	Identificar_Linea_e_Imprimir
Identificar_Linea_e_Imprimir:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	move	$v0,$a0
	sw	$a1,52($fp)
	sb	$v0,24($fp)
	lb	$v1,24($fp)
	li	$v0,10			# 0xa
	bne	$v1,$v0,$L27
	lw	$v0,52($fp)
	lb	$v0,8($v0)
	bne	$v0,$zero,$L26
$L27:
	lw	$v0,52($fp)
	lw	$v0,4($v0)
	beq	$v0,$zero,$L26
	lb	$v0,24($fp)
	bne	$v0,$zero,$L25
$L26:
	lw	$a0,52($fp)
	la	$t9,Imprimir_Linea
	jal	$ra,$t9
	lw	$v0,52($fp)
	lw	$v1,52($fp)
	lw	$v1,4($v1)
	sw	$v1,0($v0)
$L25:
	lw	$v1,52($fp)
	lbu	$v0,24($fp)
	sb	$v0,8($v1)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	Identificar_Linea_e_Imprimir
	.size	Identificar_Linea_e_Imprimir, .-Identificar_Linea_e_Imprimir
	.rdata
	.align	2
$LC2:
	.ascii	"r\000"
	.text
	.align	2
	.globl	Process_File
	.ent	Process_File
Process_File:
	.frame	$fp,112,$ra		# vars= 72, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,112
	.cprestore 16
	sw	$ra,104($sp)
	sw	$fp,100($sp)
	sw	$gp,96($sp)
	move	$fp,$sp
	sw	$a0,112($fp)
	sw	$a1,116($fp)
	sw	$a2,120($fp)
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	lw	$v1,120($fp)
	lw	$v0,116($fp)
	slt	$v0,$v1,$v0
	beq	$v0,$zero,$L29
	li	$v0,32			# 0x20
	sb	$v0,28($fp)
	sw	$zero,56($fp)
	sw	$zero,60($fp)
	sw	$zero,64($fp)
	sw	$zero,68($fp)
	sw	$zero,72($fp)
	lw	$a0,112($fp)
	la	$a1,$LC2
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,68($fp)
	lw	$v0,56($fp)
	sw	$v0,32($fp)
	lw	$v0,60($fp)
	sw	$v0,36($fp)
	lw	$v0,64($fp)
	sw	$v0,40($fp)
	lw	$v0,68($fp)
	sw	$v0,44($fp)
	lw	$v0,72($fp)
	sw	$v0,48($fp)
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,80($fp)
	lw	$v0,44($fp)
	beq	$v0,$zero,$L30
	lw	$a0,44($fp)
	move	$a1,$zero
	li	$a2,2			# 0x2
	la	$t9,fseek
	jal	$ra,$t9
	lw	$a0,44($fp)
	la	$t9,ftell
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$a0,112($fp)
	la	$t9,is_regular
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v1,24($fp)
	li	$v0,-1			# 0xffffffffffffffff
	beq	$v1,$v0,$L32
	lw	$v0,24($fp)
	bne	$v0,$zero,$L31
$L32:
	lw	$v0,24($fp)
	sw	$v0,84($fp)
	b	$L28
$L31:
	.set	noreorder
	nop
	.set	reorder
$L33:
	lw	$a0,44($fp)
	lw	$a1,80($fp)
	li	$a2,2			# 0x2
	la	$t9,fseek
	jal	$ra,$t9
	lw	$a0,44($fp)
	la	$t9,ftell
	jal	$ra,$t9
	sw	$v0,36($fp)
	addu	$v0,$fp,28
	move	$a0,$v0
	li	$a1,1			# 0x1
	li	$a2,1			# 0x1
	lw	$a3,44($fp)
	la	$t9,fread
	jal	$ra,$t9
	lb	$v0,28($fp)
	addu	$v1,$fp,32
	move	$a0,$v0
	move	$a1,$v1
	la	$t9,Identificar_Linea_e_Imprimir
	jal	$ra,$t9
	lw	$v0,80($fp)
	addu	$v0,$v0,-1
	sw	$v0,80($fp)
	lw	$v0,36($fp)
	bne	$v0,$zero,$L33
	lw	$a0,44($fp)
	la	$t9,fclose
	jal	$ra,$t9
	b	$L29
$L30:
	lw	$a0,112($fp)
	la	$t9,Is_Option
	jal	$ra,$t9
	beq	$v0,$zero,$L39
	li	$v0,-2			# 0xfffffffffffffffe
	sw	$v0,88($fp)
	b	$L40
$L39:
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,88($fp)
$L40:
	lw	$v0,88($fp)
	sw	$v0,24($fp)
$L29:
	lw	$v0,24($fp)
	sw	$v0,84($fp)
$L28:
	lw	$v0,84($fp)
	move	$sp,$fp
	lw	$ra,104($sp)
	lw	$fp,100($sp)
	addu	$sp,$sp,112
	j	$ra
	.end	Process_File
	.size	Process_File, .-Process_File
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
