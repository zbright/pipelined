#--------------------------------------
# This test case fails because when LW is in MEM
# stage, iHit = 0, so PC does not increment.
# Normally the pipeline will advance despite
# iHit being 0, with bubbles coming into the IFID
# register.
#
# However, when a branch or jump instruction in
# the EX stage wants to update the PC due to a
# necessary branch, this means that we should not
# let the pipeline proceed until the provided branch
# address receives an iHit (if we did not wait,
# the branch address will be lost when the pipeline
# advances)
#
# Line A has such a branch following a load that
# causes the pipeline to stall at the idex register
# while it waits for iHit.
#
# HOWEVER!! This branch also takes as an argument the
# output of the ori instruction at Line B!
# When we stall the pipeline at idex, we allow MEM and
# WB to advance a stage.  The forwarded value from
# Line B in WB disappears, and we calculate a different
# branch comparison.
# 
# This is NOT correct behavior.  Some kind of 
# sequential logic needs to be in place to catch this
# very dangerous behavior.
#--------------------------------------
  org 0x0000
  ori   $6, $6, 0x0F00  # (B)
  lw    $15, 0($6)
  bne   $6, $0, itworks # (A)
  sw    $6, 8($15)      #If this executes, program fail
  halt
  itworks:
  sw    $6, 0($15)
  halt

  org 0x0F00
  cfw 0xF0
