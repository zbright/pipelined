
  #------------------------------------------------------------------
  # R-type Instruction (ALU) Test Program
  #------------------------------------------------------------------

  org 0x0000
  addiu   $1,$zero,0x4
  addiu   $2,$zero,0x2
  addiu   $3,$zero,0x0
  addiu   $4,$zero,0x9

  ori   $21,$zero,0x80
  ori   $22,$zero,0xF0

  sltiu $5,$1,0x5
  sltiu $6,$1,0x2
  slti $7,$1,0x5
  slti $8,$1,0x2

# Store them to verify the results
  sw    $5,0($21)
  sw    $6,4($21)
  sw    $7,8($21)
  sw    $8,12($21)
  halt  # that's all
