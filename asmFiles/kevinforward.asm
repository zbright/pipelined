
  #------------------------------------------------------------------
  # Test lw sw
  #------------------------------------------------------------------

  org   0x0000
  ori   $1, $zero, 0xF0
  ori   $2, $zero, 0x100
  ori   $3, $zero, 0x200
  ori   $4, $zero, 0x300
  ori   $5, $zero, 0x400
  and   $2, $4, $3
  or    $5, $2, $3
  addu  $5, $2, $2
  sw    $6, 0($1)
  sw    $5, 4($1)
  sw    $2, 8($1)
  halt      # that's all

