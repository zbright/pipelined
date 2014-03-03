	org	0x0000
	ori	$10,$0,0x3FF4

	sw	$0,8($10)
	ori	$1,$0,0x01
	ori	$2,$0,0x02
	lw	$3,0($10)
	lw	$4,4($10)
	or	$5,$0,$0
	or	$6,$0,$0

mult:
	and	$5,$3,$1
	beq	$0,$5,multadd
	addu	$6,$6,$4

multadd:
	sll	$4,$4,1
	srl	$3,$3,1
	beq	$0,$3,multend
	beq	$0,$0,mult

multend:
	sw	$6,8($10) # answer 18 be at address 3FFC
	halt

	org	0x3FF4
	cfw	4
	cfw	6
