#---------------------------------------
# sample asm file for tutorial
#---------------------------------------

# set the address where you want this
# code segment
  org 0x0000
  addi $13, $0, 0
#initialize the mask
  addi $2, $0, 0x1
  addi $3, $0, 0xFFFFFFFE
  addi $4, $0, 0xFFFC
#initialize the initial values to the stack	
  addi $5, $0, 4
  addi $6, $0, 4
  addi $11, $0, 5
  addi $12, $0, 6
#initialize stack pointer
  addi $29, $0, 0xFFFC
  PUSH $5
  PUSH $6
  PUSH $11
  PUSH $12
#register 7 has the value of the top item on the stack
  POP $7
Stackloop: Beq $29, $4, Exitstack
#register 8 has the value of the next item on the stack
  POP $8
#retrieve the values from the stack
Loop: beq $8, $0, Exitmult
#checks right most bit if 0 or 1
  and $9, $8, $2
  bne $9, $2, ZERO
  add $10, $10, $7
ZERO:
  sll $7, $7, 1
  srl $8, $8, 1
  j Loop
Exitmult:
  #add $13, $0, $10
  #addi $10, $0, 0
  #add $7, $0, $13
  add $7, $0, $10
  addi $10, $0, 0
  j Stackloop
Exitstack:
#push answer on top of stack
  push $7
#retrieve answer from top of stack
  pop $28
  halt



	
