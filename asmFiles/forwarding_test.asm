	org 0x0000
	ori $10,$zero,0x3FF4
	ori $6,$zero,0x0F
	ori $7,$zero,0x1F
	ori $8,$zero,0x2F

	sw $6,0($10)
	sw $7,4($10)
	sw $8,8($10)
	lw $1,8($10)
	addu $1,$1,$8
	lw $2,4($10)
	addu $2,$8,$2
	sw $2,12($10)
	lw $3,0($10)
	sw $3,16($10)
	ori $0,$0,0xFF
	addu $0,$0,$1
	addu $4,$7,$8
	addu $5,$4,$7
	sw  $5,20($10)
	lw  $5,4($10)
	addi $11,$5,0x3
	add $12,$11,$4
	halt
