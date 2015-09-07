	.file	1 "Process_Stdin.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"-\000"
	.text
	.align	2
	.globl	Is_Stdin
	.ent	Is_Stdin
Is_Stdin:
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
	sw	$a1,52($fp)
	sw	$a2,56($fp)
	sb	$zero,24($fp)
	lw	$v1,52($fp)
	li	$v0,1			# 0x1
	beq	$v1,$v0,$L19
	lw	$v0,48($fp)
	lw	$v1,52($fp)
	slt	$v0,$v0,$v1
	beq	$v0,$zero,$L18
	lw	$a0,56($fp)
	la	$t9,strlen
	jal	$ra,$t9
	lw	$a0,56($fp)
	la	$a1,$LC0
	move	$a2,$v0
	la	$t9,strncmp
	jal	$ra,$t9
	bne	$v0,$zero,$L18
$L19:
	li	$v0,1			# 0x1
	sb	$v0,24($fp)
$L18:
	lbu	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	Is_Stdin
	.size	Is_Stdin, .-Is_Stdin
	.rdata
	.align	2
$LC1:
	.ascii	"%s\n\000"
	.text
	.align	2
	.globl	show_lines
	.ent	show_lines
show_lines:
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
$L21:
	lw	$a0,40($fp)
	la	$t9,empty
	jal	$ra,$t9
	beq	$v0,$zero,$L23
	b	$L20
$L23:
	lw	$a0,40($fp)
	la	$t9,top
	jal	$ra,$t9
	la	$a0,$LC1
	move	$a1,$v0
	la	$t9,printf
	jal	$ra,$t9
	lw	$a0,40($fp)
	la	$t9,pop
	jal	$ra,$t9
	b	$L21
$L20:
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	show_lines
	.size	show_lines, .-show_lines
	.align	2
	.globl	assign
	.ent	assign
assign:
	.frame	$fp,24,$ra		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$gp,16($sp)
	move	$fp,$sp
	sw	$a0,24($fp)
	sw	$a1,28($fp)
	move	$v0,$a2
	sb	$v0,8($fp)
	lw	$v0,24($fp)
	lw	$v1,28($fp)
	lw	$a0,0($v0)
	lw	$v0,0($v1)
	addu	$v1,$a0,$v0
	lbu	$v0,8($fp)
	sb	$v0,0($v1)
	li	$v0,1			# 0x1
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	assign
	.size	assign, .-assign
	.align	2
	.globl	add_character
	.ent	add_character
add_character:
	.frame	$fp,48,$ra		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,44($sp)
	sw	$fp,40($sp)
	sw	$gp,36($sp)
	sw	$s0,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	move	$v0,$a2
	sb	$v0,24($fp)
	lw	$s0,48($fp)
	lw	$v1,48($fp)
	lw	$v0,52($fp)
	lw	$v0,0($v0)
	addu	$v0,$v0,1
	lw	$a0,0($v1)
	move	$a1,$v0
	la	$t9,realloc
	jal	$ra,$t9
	sw	$v0,0($s0)
	lw	$v0,48($fp)
	lw	$v0,0($v0)
	beq	$v0,$zero,$L26
	lb	$v0,24($fp)
	lw	$a0,48($fp)
	lw	$a1,52($fp)
	move	$a2,$v0
	la	$t9,assign
	jal	$ra,$t9
	sw	$v0,28($fp)
	b	$L27
$L26:
	li	$a0,-1			# 0xffffffffffffffff
	la	$t9,ERROR_MSJ
	jal	$ra,$t9
	sw	$v0,28($fp)
$L27:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	lw	$s0,32($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	add_character
	.size	add_character, .-add_character
	.align	2
	.globl	store_character
	.ent	store_character
store_character:
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
	sw	$a2,56($fp)
	sb	$v0,24($fp)
	lb	$v0,24($fp)
	lw	$a0,52($fp)
	lw	$a1,56($fp)
	move	$a2,$v0
	la	$t9,add_character
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v1,56($fp)
	lw	$v0,56($fp)
	lw	$v0,0($v0)
	addu	$v0,$v0,1
	sw	$v0,0($v1)
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	store_character
	.size	store_character, .-store_character
	.align	2
	.globl	store_line
	.ent	store_line
store_line:
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
	sw	$a1,52($fp)
	sw	$a2,56($fp)
	sb	$zero,24($fp)
	lb	$v0,24($fp)
	lw	$a0,52($fp)
	lw	$a1,56($fp)
	move	$a2,$v0
	la	$t9,add_character
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,52($fp)
	lw	$a0,48($fp)
	lw	$a1,0($v0)
	la	$t9,push
	jal	$ra,$t9
	lw	$v0,52($fp)
	sw	$zero,0($v0)
	lw	$v0,56($fp)
	sw	$zero,0($v0)
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	store_line
	.size	store_line, .-store_line
	.rdata
	.align	2
$LC2:
	.ascii	"%c\000"
	.text
	.align	2
	.globl	Process_Stdin
	.ent	Process_Stdin
Process_Stdin:
	.frame	$fp,72,$ra		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$zero,28($fp)
	sw	$zero,32($fp)
	sw	$zero,40($fp)
	li	$v0,1			# 0x1
	sw	$v0,44($fp)
	addu	$a0,$fp,24
	la	$t9,create
	jal	$ra,$t9
$L31:
	addu	$v0,$fp,36
	la	$a0,__sF
	la	$a1,$LC2
	move	$a2,$v0
	la	$t9,fscanf
	jal	$ra,$t9
	sw	$v0,40($fp)
	lb	$v1,36($fp)
	li	$v0,10			# 0xa
	beq	$v1,$v0,$L36
	lw	$v1,40($fp)
	li	$v0,-1			# 0xffffffffffffffff
	beq	$v1,$v0,$L36
	b	$L34
$L36:
	addu	$v0,$fp,28
	addu	$v1,$fp,32
	addu	$a0,$fp,24
	move	$a1,$v0
	move	$a2,$v1
	la	$t9,store_line
	jal	$ra,$t9
	sw	$v0,48($fp)
	b	$L35
$L34:
	lb	$v0,36($fp)
	addu	$v1,$fp,28
	addu	$a2,$fp,32
	move	$a0,$v0
	move	$a1,$v1
	la	$t9,store_character
	jal	$ra,$t9
	sw	$v0,48($fp)
$L35:
	lw	$v0,48($fp)
	sw	$v0,44($fp)
	lw	$v1,40($fp)
	li	$v0,-1			# 0xffffffffffffffff
	beq	$v1,$v0,$L32
	lw	$v0,44($fp)
	bne	$v0,$zero,$L31
$L32:
	lw	$v0,44($fp)
	beq	$v0,$zero,$L39
	addu	$a0,$fp,24
	la	$t9,show_lines
	jal	$ra,$t9
$L39:
	lw	$v0,28($fp)
	beq	$v0,$zero,$L40
	lw	$a0,28($fp)
	la	$t9,free
	jal	$ra,$t9
$L40:
	addu	$a0,$fp,24
	la	$t9,empty
	jal	$ra,$t9
	lw	$v0,44($fp)
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	Process_Stdin
	.size	Process_Stdin, .-Process_Stdin
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
