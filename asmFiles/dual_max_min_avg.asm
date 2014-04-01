#------------------------------------------
# Originally Test and Set example by Eric Villasenor
# Modified to be LL and SC example by Yue Du
#------------------------------------------

#----------------------------------------------------------
# First Processor
#----------------------------------------------------------
  org   0x0000              # first processor p0
  ori   $sp, $zero, 0x3ffc  # stack
  ori   $a0, $zero, 0x5     # seed value
  ori   $s6, $zero, 0x100     # total values
  ori   $s5, $zero, 0x28      # buffer size
  ori   $t8, $zero, 0x0       # counter for buffer
  jal   crc32
  ori   $t9, $zero, res
  ori   $s7, $zero, 0x1
  #or   $t1, $zero, $v0
  sw    $v0, 0($t9)
  or    $s0, $zero, $v0
  addiu $t8, $t8, 0x4

  ori   $a0, $zero, locks
  jal   unlock
  jal   mainp0              # go to program
  halt

# pass in an address to lock function in argument register 0
# returns when lock is available
lock:
aquire:
  ll    $t0, 0($a0)         # load lock location
  bne   $t0, $0, aquire     # wait on lock to be open
  addiu $t0, $t0, 1
  sc    $t0, 0($a0)
  beq   $t0, $0, lock       # if sc failed retry
  jr    $ra


# pass in an address to unlock function in argument register 0
# returns when lock is free
unlock:
  sw    $0, 0($a0)
  jr    $ra

# main function does something ugly but demonstrates beautifully
mainp0:
  push  $ra                 # save return address
pro1:
  ori   $a0, $zero, locks       # move lock to arguement register
  addu  $a0, $a0, $t8
  jal   lock                # try to aquire the lock
  # critical code segment
  ori   $a0, $s0, 0x0 
  jal   crc32
  ori   $t2, $zero, res
  addu  $t2, $t2, $t8 
  sw    $v0, 0($t2)
  ori   $s0, $v0, 0x0
  # critical code segment
  ori   $a0, $zero, locks      # move lock to arguement register
  addu  $a0, $a0, $t8
  jal   unlock              # release the lock

  addiu $t8, $t8, 0x4

  bne   $t8, $s5, loop
  ori   $t8, $zero, 0x0
loop:
  addiu $s7, $s7, 0x1
  bne   $s7, $s6, pro1
  pop   $ra                 # get return address
  jr    $ra                 # return to caller
locks:
  cfw 0x1
  cfw 0x0
  cfw 0x0
  cfw 0x0
  cfw 0x0
  cfw 0x0
  cfw 0x0
  cfw 0x0
  cfw 0x0
  cfw 0x0


#----------------------------------------------------------
# Second Processor
#----------------------------------------------------------
  org   0x200               # second processor p1
  ori   $sp, $zero, 0x7ffc  # stac
  ori   $a0, $zero, 0x0
  ori   $a1, $zero, 0x0
  ori   $s1, $zero, 0x0
  ori   $s3, $zero, 0x0     # max values
  ori   $s4, $zero, 0xFFFFFFFF     # min values  
  ori   $s5, $zero, 0x0     # sum
  ori   $s6, $zero, 0x100     # total values
  ori   $s7, $zero, 0x28      # buffer size
  ori   $t8, $zero, 0x0       # counter for buffer
  ori   $t7, $zero, 0x0       # counter for total
  jal   mainp1              # go to program
  halt

# main function does something ugly but demonstrates beautifully
mainp1:
  push  $ra                 # save return address
pro2:
  ori   $a0, $zero, locks      # move lock to arguement register
  addu  $a0, $a0, $t8 
  jal   lock                # try to aquire the lock
# critical code segment
  ori   $t2, $zero, res
  addu  $t2, $t2, $t8 
  lw    $s2, 0($t2)

  
  ori   $a0, $s3, 0x0
  andi   $a0, $a0, 0x0000FFFF
  ori   $a1, $s2, 0x0
  andi   $a1, $a1, 0x0000FFFF

  addu  $s5, $s5, $a1       # add to sum

  jal   max
  ori   $s3, $v0, 0x0       # resetting the max

  ori   $a0, $s4, 0x0
  andi   $a0, $a0, 0x0000FFFF
  ori   $a1, $s2, 0x0
  andi   $a1, $a1, 0x0000FFFF
  jal   min
  ori   $s4, $v0, 0x0       # resetting the min
# critical code segment
  ori   $a0, $zero, locks      # move lock to arguement register
  addu  $a0, $a0, $t8 
  jal   unlock              # release the lock

  addiu $t8, $t8, 0x4

  bne   $t8, $s7, loop1
  ori   $t8, $zero, 0x0
loop1:
  addiu $s1, $s1, 0x1
  bne   $s1, $s6, pro2

  srl   $s5, $s5, 8

  pop   $ra                 # get return address
  jr    $ra                 # return to caller

res:
  cfw 0x0                   # end result should be 3
  cfw 0x0
  cfw 0x0
  cfw 0x0
  cfw 0x0
  cfw 0x0
  cfw 0x0
  cfw 0x0
  cfw 0x0
  cfw 0x0

#-max (a0=a,a1=b) returns v0=max(a,b)--------------
max:
  push  $ra
  push  $a0
  push  $a1
  or    $v0, $0, $a0
  slt   $t0, $a0, $a1
  beq   $t0, $0, maxrtn
  or    $v0, $0, $a1
maxrtn:
  pop   $a1
  pop   $a0
  pop   $ra
  jr    $ra
#--------------------------------------------------

#-min (a0=a,a1=b) returns v0=min(a,b)--------------
min:
  push  $ra
  push  $a0
  push  $a1
  or    $v0, $0, $a0
  slt   $t0, $a1, $a0
  beq   $t0, $0, minrtn
  or    $v0, $0, $a1
minrtn:
  pop   $a1
  pop   $a0
  pop   $ra
  jr    $ra
#--------------------------------------------------

# $v0 = crc32($a0)
crc32:
  lui $t1, 0x04C1
  ori $t1, $t1, 0x1DB7
  or $t2, $0, $0
  ori $t3, $0, 32

l1:
  slt $t4, $t2, $t3
  beq $t4, $zero, l2

  srl $t4, $a0, 31
  sll $a0, $a0, 1
  beq $t4, $0, l3
  xor $a0, $a0, $t1
l3:
  addiu $t2, $t2, 1
  j l1
l2:
  or $v0, $a0, $0
  jr $ra
#------------------------------------------------------
