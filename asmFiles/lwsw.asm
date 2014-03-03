#--------------------------------------
# Test with a fibonacci sequence
#--------------------------------------
  org 0x0000
  ori   $6, $6, 0x0F00
  lw    $15, 0($6)
  sw    $15, 4($6)
  halt

  org 0x80

start:
  cfw 0
  cfw 1

#uncomment to work with the simulator (sim)
# comment to use mmio

  org 0x0F00
  cfw 22
