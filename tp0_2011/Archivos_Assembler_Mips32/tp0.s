	.file	1 "tp0.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	main
	.ent	main
main:
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
	sw	$a1,60($fp)
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	li	$v0,1			# 0x1
	sw	$v0,28($fp)
	lw	$v1,56($fp)
	li	$v0,2			# 0x2
	bne	$v1,$v0,$L20
	lw	$v0,60($fp)
	addu	$v0,$v0,4
	lw	$a0,0($v0)
	la	$t9,Is_Option
	jal	$ra,$t9
	beq	$v0,$zero,$L20
	lw	$v0,60($fp)
	addu	$v0,$v0,4
	lw	$a0,0($v0)
	la	$t9,Print_Option_Msg
	jal	$ra,$t9
	b	$L19
$L20:
	lw	$v1,28($fp)
	li	$v0,-1			# 0xffffffffffffffff
	beq	$v1,$v0,$L21
	lw	$v0,28($fp)
	beq	$v0,$zero,$L21
	lw	$v1,28($fp)
	li	$v0,-2			# 0xfffffffffffffffe
	beq	$v1,$v0,$L21
	lw	$v0,24($fp)
	lw	$v1,56($fp)
	slt	$v0,$v1,$v0
	beq	$v0,$zero,$L22
	b	$L21
$L22:
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,60($fp)
	addu	$v0,$v1,$v0
	lw	$a0,24($fp)
	lw	$a1,56($fp)
	lw	$a2,0($v0)
	la	$t9,Is_Stdin
	jal	$ra,$t9
	beq	$v0,$zero,$L24
	la	$t9,Process_Stdin
	jal	$ra,$t9
	sw	$v0,36($fp)
	b	$L25
$L24:
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,60($fp)
	addu	$v0,$v1,$v0
	lw	$a0,0($v0)
	lw	$a1,56($fp)
	lw	$a2,24($fp)
	la	$t9,Process_File
	jal	$ra,$t9
	sw	$v0,36($fp)
$L25:
	lw	$v0,36($fp)
	sw	$v0,28($fp)
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L20
$L21:
	lw	$v1,28($fp)
	li	$v0,-1			# 0xffffffffffffffff
	beq	$v1,$v0,$L27
	lw	$v0,28($fp)
	beq	$v0,$zero,$L27
	lw	$v1,28($fp)
	li	$v0,-2			# 0xfffffffffffffffe
	beq	$v1,$v0,$L27
	b	$L19
$L27:
	lw	$a0,28($fp)
	la	$t9,ERROR_MSJ
	jal	$ra,$t9
	sw	$v0,32($fp)
	b	$L17
$L19:
	sw	$zero,32($fp)
$L17:
	lw	$v0,32($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
