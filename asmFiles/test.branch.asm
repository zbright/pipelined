
  #------------------------------------------------------------------
  # R-type Instruction (ALU) Test Program
  #------------------------------------------------------------------

  org 0x0000
  ori   $1,$zero,0x4
  ori   $2,$zero,0x2
  ori   $3,$zero,0x0
  ori   $4,$zero,0x9
  ori   $5,$zero,0x28

  ori   $21,$zero,0x80
  ori   $22,$zero,0xF0

  JR     $5
  addiu  $1,$1,0x1
  addiu  $1,$1,0x1
  addiu  $1,$1,0x1
  JAL LOOP
  addiu  $1,$1,0x1
  addiu  $1,$1,0x1
  addiu  $1,$1,0x1
LOOP:
  addiu  $2,$2,0x1
  bne   $2,$4,LOOP
DOOP:  
  addiu  $3,$3,0x1
  beq   $3,$4,DOOP

# Store them to verify the results
  sw    $1,0($21)
  sw    $2,4($21)
  sw    $3,8($21)
  sw    $31,12($21)
  
  halt  # that's all
