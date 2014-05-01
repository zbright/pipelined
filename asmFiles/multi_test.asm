  org 0x0000


ori   $5, $0, 0
ori   $6, $0, 0x0A00

loop:
addiu $5, $5, 1
bne   $5, $6, loop


  halt  # that's all

  org 0x200

#section 1
  ori   $1,$zero,0xD269
  ori   $2,$zero,0x37F1

  ori   $21,$zero,0x80
  ori   $22,$zero,0xF0

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


#section 2
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

  halt  # that's all

  vals:
    cfw 0x100
