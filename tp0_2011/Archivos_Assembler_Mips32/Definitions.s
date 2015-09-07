	.file	1 "Definitions.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	is_regular
	.ent	is_regular
is_regular:
	.frame	$fp,152,$ra		# vars= 112, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,152
	.cprestore 16
	sw	$ra,144($sp)
	sw	$fp,140($sp)
	sw	$gp,136($sp)
	move	$fp,$sp
	sw	$a0,152($fp)
	lw	$a0,152($fp)
	addu	$a1,$fp,24
	la	$t9,__stat13
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L18
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,128($fp)
	b	$L17
$L18:
	lw	$v0,32($fp)
	andi	$v0,$v0,0xf000
	sw	$v0,132($fp)
	li	$v0,32768			# 0x8000
	lw	$v1,132($fp)
	xor	$v0,$v1,$v0
	sltu	$v0,$v0,1
	sw	$v0,132($fp)
	lw	$v0,132($fp)
	sw	$v0,128($fp)
$L17:
	lw	$v0,128($fp)
	move	$sp,$fp
	lw	$ra,144($sp)
	lw	$fp,140($sp)
	addu	$sp,$sp,152
	j	$ra
	.end	is_regular
	.size	is_regular, .-is_regular
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
