	org 0x0000
	ori $1,$0,0x33
	j test1
test3:	jal test4
	lw $3,800($0)
	j test5
exit:	
	halt
	
test1:
	j test2


test2:
	j test3

test4:
	sw $1,800($0)
	jr $31

test5:
	jal test4
	j exit
