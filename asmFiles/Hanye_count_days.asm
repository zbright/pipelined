	org	0x0000	

	ori	$sp,$0,0x4000
	ori	$1,$0,0		#current year
	ori	$2,$0,0 	#current month
	ori	$3,$0,0 	#current day
	ori	$4,$0,4 	#const 4
	ori	$5,$0,1		#const 1
	ori	$6,$0,2000	#const 2000
	ori	$7,$0,30	#const 30
	ori	$8,$0,365	#const 365
	ori	$9,$0,0		#result

	ori	$10,$0,2014
	ori	$11,$0,1
	ori	$12,$0,18
	subu	$sp,$sp,$4
	sw	$10,0($sp)
	subu	$sp,$sp,$4
	sw	$11,0($sp)
	subu	$sp,$sp,$4
	sw	$12,0($sp)

	lw	$3,0($sp)
	addiu	$sp,$sp,4

	lw	$2,0($sp)
	addiu	$sp,$sp,4

	lw	$1,0($sp)
	addiu	$sp,$sp,4

	subu	$2,$2,$5
	subu	$sp,$sp,$4
	sw	$2,0($sp)
	subu	$sp,$sp,$4
	sw	$7,0($sp)

	jal	mult
	subu	$sp,$sp,$4
	sw	$13,0($sp)
	lw	$9,0($sp)
	addiu	$sp,$sp,4
	addu	$9,$9,$3
	subu	$1,$1,$6
	#halt
	subu	$sp,$sp,$4
	sw	$1,0($sp)
	subu	$sp,$sp,$4
	sw	$8,0($sp)

	jal	mult
	addu	$9,$9,$13
	#halt
	subu	$sp,$sp,$4
	sw	$9,0($sp)
	halt

	org 0x0800
mult:
	lw	$14,0($sp)
	addiu	$sp,$sp,4
	lw	$15,0($sp)
	addiu	$sp,$sp,4
	and	$13,$13,$0
	ori	$16,$0,0x0001
multloop:
	beq	$15,$0,multend
	and	$17,$15,$16
	beq	$17,$0,shift
	addu	$13,$13,$14
shift:
	srl	$15,$15,1
	sll	$14,$14,1
	j	multloop
multend:
	jr	$31
