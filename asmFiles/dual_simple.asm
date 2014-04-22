  org   0x0000
  ori   $1, $zero, 0x1FC0
  ori   $2, $zero, 0x80

  ll    $3, 0($2)
  addiu   $3, $3, 0x01
  sc    $3, 0($2)

  halt      # that's all

  org   0x0200
  ori   $1, $zero, 0x1FC0
  ori   $2, $zero, 0x90

  ll    $3, 0($2)
  addiu   $3, $3, 0x01
  sc    $3, 0($2)

  halt      # that's all
