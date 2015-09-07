	.file	1 "Stack.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	create
	.ent	create
create:
	.frame	$fp,16,$ra		# vars= 0, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,16
	.cprestore 0
	sw	$fp,12($sp)
	sw	$gp,8($sp)
	move	$fp,$sp
	sw	$a0,16($fp)
	lw	$v0,16($fp)
	sw	$zero,0($v0)
	move	$sp,$fp
	lw	$fp,12($sp)
	addu	$sp,$sp,16
	j	$ra
	.end	create
	.size	create, .-create
	.align	2
	.globl	empty
	.ent	empty
empty:
	.frame	$fp,16,$ra		# vars= 0, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,16
	.cprestore 0
	sw	$fp,12($sp)
	sw	$gp,8($sp)
	move	$fp,$sp
	sw	$a0,16($fp)
	lw	$v0,16($fp)
	lw	$v0,0($v0)
	xori	$v0,$v0,0x0
	sltu	$v0,$v0,1
	move	$sp,$fp
	lw	$fp,12($sp)
	addu	$sp,$sp,16
	j	$ra
	.end	empty
	.size	empty, .-empty
	.align	2
	.globl	push
	.ent	push
push:
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
	li	$a0,1			# 0x1
	li	$a1,8			# 0x8
	la	$t9,calloc
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	beq	$v0,$zero,$L20
	lw	$v0,24($fp)
	lw	$v1,60($fp)
	sw	$v1,0($v0)
	lw	$v0,24($fp)
	sw	$v0,32($fp)
	lw	$a0,56($fp)
	la	$t9,empty
	jal	$ra,$t9
	bne	$v0,$zero,$L21
	lw	$v0,56($fp)
	lw	$v0,0($v0)
	sw	$v0,36($fp)
	b	$L22
$L21:
	sw	$zero,36($fp)
$L22:
	lw	$v0,36($fp)
	lw	$v1,32($fp)
	sw	$v0,4($v1)
	lw	$v1,56($fp)
	lw	$v0,24($fp)
	sw	$v0,0($v1)
	b	$L23
$L20:
	li	$a0,-1			# 0xffffffffffffffff
	la	$t9,ERROR_MSJ
	jal	$ra,$t9
	sw	$v0,28($fp)
	b	$L19
$L23:
	sw	$zero,28($fp)
$L19:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	push
	.size	push, .-push
	.align	2
	.globl	pop
	.ent	pop
pop:
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
	lw	$v0,48($fp)
	lw	$v0,0($v0)
	sw	$v0,24($fp)
	lw	$v1,48($fp)
	lw	$v0,48($fp)
	lw	$v0,0($v0)
	lw	$v0,4($v0)
	sw	$v0,0($v1)
	lw	$v0,24($fp)
	lw	$a0,0($v0)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,24($fp)
	la	$t9,free
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	pop
	.size	pop, .-pop
	.align	2
	.globl	top
	.ent	top
top:
	.frame	$fp,16,$ra		# vars= 0, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,16
	.cprestore 0
	sw	$fp,12($sp)
	sw	$gp,8($sp)
	move	$fp,$sp
	sw	$a0,16($fp)
	lw	$v0,16($fp)
	lw	$v0,0($v0)
	lw	$v0,0($v0)
	move	$sp,$fp
	lw	$fp,12($sp)
	addu	$sp,$sp,16
	j	$ra
	.end	top
	.size	top, .-top
	.align	2
	.globl	destroy
	.ent	destroy
destroy:
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
$L27:
	lw	$a0,40($fp)
	la	$t9,empty
	jal	$ra,$t9
	beq	$v0,$zero,$L29
	b	$L26
$L29:
	lw	$a0,40($fp)
	la	$t9,pop
	jal	$ra,$t9
	b	$L27
$L26:
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	destroy
	.size	destroy, .-destroy
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
