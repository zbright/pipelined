
  #------------------------------------------------------------------
  # Test lw sw
  #------------------------------------------------------------------

  org   0x0000
  ori   $1, $zero, 0xF0
  ori   $2, $zero, 0x100
  ori   $3, $zero, 0x200
  ori   $4, $zero, 0x300
  ori   $5, $zero, 0x400
  lw    $6, 12($1)
  #nop  #ERROR HERE
  addiu  $6, $6, 8
  ori    $0, $0, 1
  ori    $0, $0, 2
  ori    $0, $0, 3
  ori    $0, $0, 4
  ori    $0, $0, 5
  ori    $0, $0, 6

  #lw    $7, 4($1)
  #lw    $8, 8($1)
  #ori   $4, $zero, 0x500
  #ori   $5, $zero, 0x600
  nop
  nop
  nop
  nop
  nop
  sw    $6, 16($2)
  nop
  nop
  nop
  nop
  sw    $3, 4($2)
  nop
  nop
  nop
  nop
  sw    $4, 8($2)
  nop
  nop
  nop
  nop
  halt      # that's all

  org   0x00F0
  cfw   0x7337
  cfw   0x2701
  cfw   0x1337