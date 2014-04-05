
  #------------------------------------------------------------------
  # R-type Instruction (ALU) Test Program
  #------------------------------------------------------------------

  org 0x0000
  ori   $1,$zero,0x1111
  ori 	$2, $zero, 0x200
  ori	$4, $zero, vals
  addu $5, $2, $4
  lw $6, 0($4)
  halt  # that's all


  org 0x200
  ori   $1,$zero,0x2222
  ori 	$2, $zero, 0x500
  ori	$4, $zero, vals
  addu $5, $2, $4
  lw $6, 0($4)

  halt  # that's all

  vals:
    cfw 0x100
