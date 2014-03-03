
  #------------------------------------------------------------------
  # R-type Instruction (ALU) Test Program
  #------------------------------------------------------------------

  org 0x0000
  ori   $1,$zero,0xD269
  ori   $2,$zero,0x37F1
  ori   $24,$zero,0x7000
  ori   $23,$zero,0xF000
  ori   $25,$zero,0xF80
  ori   $22,$zero,0xFF0

# Now running all R type instructions
  or    $3,$1,$2
  and   $4,$1,$2
  andi  $5,$1,0xF
  addu  $6,$1,$2
  addiu $7,$3,0x8740
  subu  $8,$4,$2
  xor   $9,$5,$2
  xori  $10,$1,0xf33f
  sll   $11,$1,4
  srl   $12,$1,5
  nor   $13,$1,$2
  slt   $14,$24,$23
  slt   $15,$23,$24
  sltu  $16,$24,$23
  sltu  $17,$23,$24
  slti  $18,$24,0xF000
  slti  $19,$24,0x6000
  sltiu $20,$24,0xF000
  sltiu $21,$24,0x6000

# Store them to verify the results
  sw    $13,0($22)
  sw    $3,0($25)
  sw    $4,4($25)
  sw    $5,8($25)
  sw    $6,12($25)
  sw    $7,16($25)
  sw    $8,20($25)
  sw    $9,24($25)
  sw    $10,28($25)
  sw    $11,32($25)
  sw    $12,36($25)
  sw    $14,40($25)
  sw    $15,44($25)
  sw    $16,48($25)
  sw    $17,52($25)
  sw    $18,56($25)
  sw    $19,60($25)
  sw    $20,64($25)
  sw    $21,68($25)

  halt  # that's all
