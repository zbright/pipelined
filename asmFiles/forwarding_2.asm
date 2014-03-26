org 0x0000
ori $15, $zero, 0x80
ori $9, $zero, 20
ori $1, $zero, 0
ori $2, $zero, 1
addu $3, $1, $2
addu $4, $2, $3
sw $4, 0($15)
addu $5, $3, $4
addu $6, $5, $4
addu $7, $6, $5
addu $8, $7, $6
lw $9, 0($15)
addu $7, $8, $9
sw $7, 4($15)
halt
