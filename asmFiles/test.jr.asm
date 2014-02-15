
  #------------------------------------------------------------------
  # R-type Instruction (ALU) Test Program
  #------------------------------------------------------------------

  org 0x0000
  ori   $1,$zero,0x4
  ori   $2,$zero,0x2
  ori   $3,$zero,0x0
  ori   $4,$zero,0x24

  ori   $21,$zero,0x80
  ori   $22,$zero,0xF0
  JR $4
  addiu  $2,$2,0x1
  addiu  $2,$2,0x1
  addiu  $2,$2,0x1
  addiu  $2,$2,0x1
  addiu  $2,$2,0x1
  addiu  $2,$2,0x1
  addiu  $2,$2,0x1
  addiu  $2,$2,0x1
  addiu  $2,$2,0x1
  addiu  $2,$2,0x1
  addiu  $2,$2,0x1
  addiu  $2,$2,0x1
BOOB:
  
  


# Store them to verify the results
  sw    $2,0($21)
  sw    $31,4($22)
  halt  # that's all
