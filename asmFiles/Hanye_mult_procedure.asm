	org	0x0000

	ori	$sp,$0,0x4000
	ori	$1,$0,3
	ori	$2,$0,6
	ori	$3,$0,8
	ori	$5,$0,13
	ori	$4,$0,4

	subu	$sp,$sp,$4
	sw	$1,0($sp)

	subu	$sp,$sp,$4
	sw	$2,0($sp)

	subu	$sp,$sp,$4
	sw	$3,0($sp)

	subu	$sp,$sp,$4
	sw	$5,0($sp)

	jal	mult
	subu	$sp,$sp,$4
	sw	$6,0($sp)

	jal 	mult
	subu	$sp,$sp,$4
	sw	$6,0($sp)

	jal	mult	#3*6*8*13 = ab0 should be at 0x3FFC
	subu	$sp,$sp,$4
	sw	$6,0($sp)
	halt
	
	org	0x0800
mult:
	lw	$7,0($sp)
	addiu	$sp,$sp,4
	lw	$8,0($sp)
	addiu	$sp,$sp,4
	and	$6,$6,$0
	ori	$5,$0,0x0001
multloop:
	beq	$8,$0,multend
	and	$3,$8,$5
	beq	$3,$0,shift
	addu	$6,$6,$7
shift:
	srl	$8,$8,1
	sll	$7,$7,1
	j	multloop
multend:
	jr	$31
