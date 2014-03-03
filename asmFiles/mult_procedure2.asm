ori $29, $0, 0xFFFC
ori $1, $0, 1
ori $2, $0, 2
ori $3, $0, 3
ori $4, $0, 4
ori $5, $0, 5
push $1
push $2
push $3
push $4
push $5

jal mult
jal mult
halt

mult: # $10/$11 are popped operands off the stack
pop $10
pop $11
ori $8, $0, 0 #Our result
ori $9, $0, 0x0001 #Temp value 1 to help us 

beq $11, $0, exit
multloop:
andi $12, $11, 1
bne $12, $9, dontMult #The LSB was 0, so we don't increase the result on this step
addu $8, $8, $10
dontMult:
sll $10, $10, 1
srl $11, $11, 1
bne $11, $0, multloop
exit:
push $8
#addi $29,$29,-4
#sw $8, 4($29)
jr $31
