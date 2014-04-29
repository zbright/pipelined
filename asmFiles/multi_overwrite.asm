org   0x0000

ori   $1, $zero, val
#lw    $2, 0($1)
ori   $3, $zero, 0xaaaa
sw    $3, 0($1)

ori   $5, $0, 0
ori   $6, $0, 0x0A00

loop:
addiu $5, $5, 1
bne   $5, $6, loop

halt      # that's all






org   0x0200

ori   $1, $zero, val
lw    $2, 0($1)
ori   $2, $2, 0x1
sw    $2, 0($1)

halt      # that's all





org	0x500
val:
  cfw 0x0200
