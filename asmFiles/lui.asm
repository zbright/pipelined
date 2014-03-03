ori $1, $0, 1
ori $2, $0, 3
ori $3, $0, 3
ori $4, $0, 3
loop:
subu $2, $2, $1
bne $2,$0,loop
loop2:
subu $3, $3, $1
bne $3,$0,loop2
loop3:
subu $4, $4, $1
bne $4,$0,loop3

sw $1, 800($2)
halt
