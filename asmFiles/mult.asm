
# set the address where you want this
# code segment
  org 0x0000
#initialize the mask
  addi $2, $0, 0x1
  addi $3, $0, 0xFFFFFFFE
  addi $4, $0, 0
#initialize the initial values to the stack	
  addi $5, $0, 3
  addi $6, $0, 3
#initialize stack pointer
  addi $29, $0, 0xFFFC
  PUSH $5
  PUSH $6
#register 7 has the value of register 6	
  POP $7
#register 8 has the value of register 5	
  POP $8
#retrieve the values from the stack
Loop: beq $8, $0, Exit
#checks right most bit if 0 or 1
  and $9, $8, $2
  bne $9, $2, ZERO
  add $10, $10, $7
ZERO: sll $7, $7, 1
  srl $8, $8, 1
  j Loop
Exit: PUSH $10
	Halt


	
