  org 0x0000
  ori $4, $zero, vals
  lw  $6, 0($4)
  halt  # that's all

  org 0x200
  ori $2, $zero, 0x500 
  ori $4, $zero, 0x200
  sw  $2, 0($4)

  halt  # that's all

  vals:
    cfw 0x100
