  org 0x0000
  ori   $1,$zero,0xD269
  ori   $2,$zero,0x0
  ori   $21,$zero,0x80
  ori   $22,$zero,0xF0

  jal	test1

  sw    $1,0($22)
  sw    $2,0($21)
  halt




test1:
  beq	$1,$2,test2
  ori   $1,$zero,0x0	

  j	test3
  halt

test2:
  ori   $2,$zero,0xFFFF
  halt

test3:
  ori   $1,$zero,0xFACE
  ori   $2,$zero,0xBADD
  BNE	$1,$2,test4
  halt

test4:
  ori   $1,$zero,0x1111
  ori   $2,$zero,0x2222
  jr	$ra
  ori   $1,$zero,0x0BAD
  ori   $2,$zero,0x0BAD
  halt




