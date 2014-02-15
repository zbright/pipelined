
# set the address where you want this
# code segment
  org 0x0000
#initialize the mask
  addi $2, $0, 0x1
  addi $3, $0, 0xFFFFFFFE
#intializeone
  addi $13, $0, 1
#initializeyear
  addi $14, $0, 2000
#currentdayvariable
  addi $4, $0, 20
#monthconstant
  addi $11, $0, 30
#monthvariable
  addi $5, $0, 1
#yearconstant
  addi $12, $0, 365
#yearvariable
  addi $6, $0, 2014
#initialize stack pointer
  addi $29, $0, 0xFFFC

#monthmult
  subu $5, $5, $13
  PUSH $5
  PUSH $11
  JAL Multbegin
  add $5, $0, $10 
#yearmult
  subu $6, $6, $14
  PUSH $6
  PUSH $12
  JAL Multbegin
  add $6, $0, $10
#add day and calculated month value and store answer in register 15
  add $15, $15, $4
  add $15, $15, $5
  add $15, $15, $6
  PUSH $15
  HALT  

Multbegin:
#register 7 has the value of register 6	
  POP $7
#register 8 has the value of register 5	
  POP $8
  addi $10, $0, 0
Loop: beq $8, $0, Exit
#checks right most bit if 0 or 1
  and $9, $8, $2
  bne $9, $2, ZERO
  add $10, $10, $7
ZERO: sll $7, $7, 1
  srl $8, $8, 1
  j Loop
Exit:  JR $31

