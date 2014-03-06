	org 0x0000
	ori $1,$0,0xFFFF
	ori $2,$0,0x1
	jal test
	sw $6, 200($0)
	j test1
exit:	
	halt

test:
	slt $3,$1,$2
	slt $4,$2,$1
	sltu $5,$1,$2
	sltu $6,$2,$1
	addu $4,$4,$3
	addu $5,$5,$4
	addu $6,$5,$6
	sw $6, 100($0)
	jr $31
test1:	
	jal test
	j exit
