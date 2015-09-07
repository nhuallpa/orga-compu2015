	.file	1 "Message.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"Usage: \n"
	.ascii	"\ttp0 -h\n"
	.ascii	"\t\000"
	.align	2
$LC1:
	.ascii	"tp0 -V\n"
	.ascii	"\t\000"
	.align	2
$LC2:
	.ascii	"tp0 [file ...]\n"
	.ascii	"Options:\n"
	.ascii	"\t\000"
	.align	2
$LC3:
	.ascii	"-V, --version\tPrint version and quit\n"
	.ascii	"\t\000"
	.align	2
$LC4:
	.ascii	"-h, --help\tPrint this information and quit\n\000"
	.text
	.align	2
	.globl	Help_Msg
	.ent	Help_Msg
Help_Msg:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	la	$a0,$LC0
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC1
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC2
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC3
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC4
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	Help_Msg
	.size	Help_Msg, .-Help_Msg
	.rdata
	.align	2
$LC5:
	.ascii	"Version 1.1 - Integrantes del Grupo: Martinez Ariel, Ali"
	.ascii	" Luis, Dworjanyn Enrique\n\000"
	.text
	.align	2
	.globl	Version_Msg
	.ent	Version_Msg
Version_Msg:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	la	$a0,$LC5
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	Version_Msg
	.size	Version_Msg, .-Version_Msg
	.rdata
	.align	2
$LC6:
	.ascii	"-h\000"
	.align	2
$LC7:
	.ascii	"--help\000"
	.align	2
$LC8:
	.ascii	"-V\000"
	.align	2
$LC9:
	.ascii	"--version\000"
	.text
	.align	2
	.globl	Is_Option
	.ent	Is_Option
Is_Option:
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
	sw	$a0,48($fp)
	sb	$zero,24($fp)
	lw	$v0,48($fp)
	beq	$v0,$zero,$L20
	lw	$a0,48($fp)
	la	$a1,$LC6
	li	$a2,2			# 0x2
	la	$t9,strncmp
	jal	$ra,$t9
	beq	$v0,$zero,$L21
	lw	$a0,48($fp)
	la	$a1,$LC7
	li	$a2,6			# 0x6
	la	$t9,strncmp
	jal	$ra,$t9
	beq	$v0,$zero,$L21
	lw	$a0,48($fp)
	la	$a1,$LC8
	li	$a2,2			# 0x2
	la	$t9,strncmp
	jal	$ra,$t9
	beq	$v0,$zero,$L21
	lw	$a0,48($fp)
	la	$a1,$LC9
	li	$a2,9			# 0x9
	la	$t9,strncmp
	jal	$ra,$t9
	bne	$v0,$zero,$L20
$L21:
	li	$v0,1			# 0x1
	sb	$v0,24($fp)
$L20:
	lbu	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	Is_Option
	.size	Is_Option, .-Is_Option
	.align	2
	.globl	Print_Option_Msg
	.ent	Print_Option_Msg
Print_Option_Msg:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	lw	$a0,40($fp)
	la	$a1,$LC6
	li	$a2,2			# 0x2
	la	$t9,strncmp
	jal	$ra,$t9
	beq	$v0,$zero,$L25
	lw	$a0,40($fp)
	la	$a1,$LC7
	li	$a2,6			# 0x6
	la	$t9,strncmp
	jal	$ra,$t9
	bne	$v0,$zero,$L23
$L25:
	la	$t9,Help_Msg
	jal	$ra,$t9
	b	$L22
$L23:
	la	$t9,Version_Msg
	jal	$ra,$t9
$L22:
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	Print_Option_Msg
	.size	Print_Option_Msg, .-Print_Option_Msg
	.rdata
	.align	2
$LC10:
	.ascii	"No es archivo regular.\n\000"
	.align	2
$LC11:
	.ascii	"Mala invocacion del programa. Ejecute ./tp0 -h para m\303"
	.ascii	"\241s ayuda\n\000"
	.text
	.align	2
	.globl	print_custom_msj
	.ent	print_custom_msj
print_custom_msj:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	lw	$v0,40($fp)
	bne	$v0,$zero,$L27
	la	$a0,__sF+176
	la	$a1,$LC10
	la	$t9,fprintf
	jal	$ra,$t9
	b	$L26
$L27:
	la	$a0,__sF+176
	la	$a1,$LC11
	la	$t9,fprintf
	jal	$ra,$t9
$L26:
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	print_custom_msj
	.size	print_custom_msj, .-print_custom_msj
	.align	2
	.globl	ERROR_MSJ
	.ent	ERROR_MSJ
ERROR_MSJ:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	lw	$v1,40($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L30
	la	$t9,__errno
	jal	$ra,$t9
	lw	$a0,0($v0)
	la	$t9,strerror
	jal	$ra,$t9
	move	$a0,$v0
	la	$t9,perror
	jal	$ra,$t9
	b	$L31
$L30:
	lw	$a0,40($fp)
	la	$t9,print_custom_msj
	jal	$ra,$t9
$L31:
	li	$v0,1			# 0x1
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	ERROR_MSJ
	.size	ERROR_MSJ, .-ERROR_MSJ
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
