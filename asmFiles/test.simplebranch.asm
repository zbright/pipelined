  org 0x0000
  ori   $1, $zero, 0xBA5C
  ori   $2, $zero, 0x0080
  bne   $2, $1, braZ
  sw    $1, 0($2)
  sw    $1, 4($2)
  sw    $1, 8($2)
  sw    $1, 12($2)
braZ:
  sw    $1, 16($2)
  halt
