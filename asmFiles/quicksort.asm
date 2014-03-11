   j main
Quicksort:        
   slt       $t0, $a1, $a2                        # a1(=p):starting position        a2(=r):ending position
   beq       $t0, $zero, Quicksort_end        # if a1>=a2 branch to Quicksort_end
   ori       $t0, $t0, 0                        # nop
   addiu     $sp, $sp, -16
   sw        $ra, 16($sp)                        # save return address
   sw        $a0, 12($sp)                        # a0 is the base address of an array (=A[])
   sw        $a1, 8($sp)
   sw        $a2, 4($sp)                        # save a0, a1, a2 to call sub-procedure
   jal       Partition                        # call Partition(A[], p, r) : same argument as current procedure
   addiu     $sp, $sp, -4
   sw        $v0, 4($sp)                        # save return value of Partition (=q)
   lw        $a0, 16($sp)
   lw        $a1, 12($sp)                        # load A[], p
   ori       $a2, $v0, 0                        # move q to a2
   jal       Quicksort                        # call Quicksort(A[], p, q)
   lw        $a0, 16($sp)                        # load A[]
   lw        $t0, 4($sp)                        # load q
   addiu     $a1, $t0, 1                        # a1 = q + 1
   lw        $a2, 8($sp)                        # load r
   jal       Quicksort                        # Quicksort(A[], q+1, r)
   ori       $t0, $t0, 0                        # nop
   addiu     $sp, $sp, 20                        # pop A[], p, r, q, ra
   lw        $ra, 0($sp)                        # restore reaturn address

Quicksort_end:        
   jr        $ra                                # return


Partition:
  addu       $t0, $a1, $a1
  addu       $t0, $t0, $t0                        # t0 = a1 * 4
  addu       $t0, $t0, $a0                       # t0 = A[] + t0
  lw         $t0, 0($t0)                        # t0 = A[p]        : x
  addiu      $t1, $a1, -1                        # i = p-1
  addiu      $t2, $a2, 1                        # j = r+1
  addu       $t3, $t1, $t1
  addu       $t3, $t3, $t3
  addu       $t3, $t3, $a0                        # t3 = adduress of A[i] to minimize the loop
  addu       $t4, $t2, $t2
  addu       $t4, $t4, $t4
  addu       $t4, $t4, $a0                        # t4 = address of A[j]

Loop1:
  addiu      $t1, $t1, 1                        # i = i+1
  addiu      $t3, $t3, 4                        # t3 = t3 + 4 : reset the address of A[i]
  lw         $t5, 0($t3)
  slt        $t6, $t5, $t0
  bne        $t6, $zero, Loop1                # if A[i] < x, branch to Loop2
  ori        $t0, $t0, 0                        # nop

Loop2:    
  addiu      $t2, $t2, -1                        # j = j-1
  addiu      $t4, $t4, -4                        # t4 = t4 - 4 : reset the address of A[j]
  lw         $t5, 0($t4)
  slt        $t6, $t0, $t5
  bne        $t6, $zero, Loop2                # if A[j] > x, branch to Loop1
  slt        $t5, $t1, $t2
  beq        $t5, $zero, Partition_end        # if i >= j, branch to Partition_end
  lw         $t5, 0($t3)
  lw         $t6, 0($t4)
  sw         $t6, 0($t3)
  sw         $t5, 0($t4)                        # swap A[i] and A[j]
  beq        $zero, $zero, Loop1

Partition_end:        
  addu       $v0, $zero, $t2                        # v0 = j
  jr         $ra                                # return


main:
  ori        $sp, $0, 0xFFEC
  ori        $t0, $0, 0xF000
  ori        $a0, $t0, 4                        # address of A[]
  lw         $t0, 0($t0)                        # load length
  addiu      $a2, $t0, -1                        # length - 1
  ori        $a1, $zero, 0                        # a1 = 0
  jal        Quicksort
  ori        $t0, $t0, 0                        # nop
  halt

  org 0xF000
list_length:
  cfw 400
search_list:
  cfw 0x7FFF087d
  cfw 0x5fcb
  cfw 0xa41a
  cfw 0x4109
  cfw 0x4522
  cfw 0x700f
  cfw 0x766d
  cfw 0x6f60
  cfw 0x8a5e
  cfw 0x9580
  cfw 0x70a3
  cfw 0xaea9
  cfw 0x711a
  cfw 0x6f81
  cfw 0x8f9a
  cfw 0x2584
  cfw 0xa599
  cfw 0x4015
  cfw 0xce81
  cfw 0xf55b
  cfw 0x399e
  cfw 0xa23f
  cfw 0x3588
  cfw 0x33ac
  cfw 0xbce7
  cfw 0x2a6b
  cfw 0x9fa1
  cfw 0xc94b
  cfw 0xc65b
  cfw 0x0068
  cfw 0xf499
  cfw 0x5f71
  cfw 0xd06f
  cfw 0x14df
  cfw 0x1165
  cfw 0xf88d
  cfw 0x4ba4
  cfw 0x2e74
  cfw 0x5c6f
  cfw 0xd11e
  cfw 0x9222
  cfw 0xacdb
  cfw 0x1038
  cfw 0xab17
  cfw 0xf7ce
  cfw 0x8a9e
  cfw 0x9aa3
  cfw 0xb495
  cfw 0x8a5e
  cfw 0xd859
  cfw 0x0bac
  cfw 0xd0db
  cfw 0x3552
  cfw 0xa6b0
  cfw 0x727f
  cfw 0x28e4
  cfw 0xe5cf
  cfw 0x163c
  cfw 0x3411
  cfw 0x8f07
  cfw 0xfab7
  cfw 0x0f34
  cfw 0xdabf
  cfw 0x6f6f
  cfw 0xc598
  cfw 0xf496
  cfw 0x9a9a
  cfw 0xbd6a
  cfw 0x2136
  cfw 0x810a
  cfw 0xca55
  cfw 0x8bce
  cfw 0x2ac4
  cfw 0xddce
  cfw 0xdd06
  cfw 0xc4fc
  cfw 0xfb2f
  cfw 0xee5f
  cfw 0xfd30
  cfw 0xc540
  cfw 0xd5f1
  cfw 0xbdad
  cfw 0x45c3
  cfw 0x708a
  cfw 0xa359
  cfw 0xf40d
  cfw 0xba06
  cfw 0xbace
  cfw 0xb447
  cfw 0x3f48
  cfw 0x899e
  cfw 0x8084
  cfw 0xbdb9
  cfw 0xa05a
  cfw 0xe225
  cfw 0xfb0c
  cfw 0xb2b2
  cfw 0xa4db
  cfw 0x8bf9
  cfw 0x12f7
  cfw 0x5fcb
  cfw 0xa41a
  cfw 0x4109
  cfw 0x4522
  cfw 0x700f
  cfw 0x766d
  cfw 0x6f60
  cfw 0x8a5e
  cfw 0x9580
  cfw 0x70a3
  cfw 0xaea9
  cfw 0x711a
  cfw 0x6f81
  cfw 0x8f9a
  cfw 0x2584
  cfw 0xa599
  cfw 0x4015
  cfw 0xce81
  cfw 0xf55b
  cfw 0x399e
  cfw 0xa23f
  cfw 0x3588
  cfw 0x33ac
  cfw 0xbce7
  cfw 0x2a6b
  cfw 0x9fa1
  cfw 0xc94b
  cfw 0xc65b
  cfw 0x0068
  cfw 0xf499
  cfw 0x5f71
  cfw 0xd06f
  cfw 0x14df
  cfw 0x1165
  cfw 0xf88d
  cfw 0x4ba4
  cfw 0xFFFFFFFE
  cfw 0x5c6f
  cfw 0xd11e
  cfw 0x9222
  cfw 0xacdb
  cfw 0x1038
  cfw 0xab17
  cfw 0xf7ce
  cfw 0x8a9e
  cfw 0x9aa3
  cfw 0xb495
  cfw 0x8a5e
  cfw 0xd859
  cfw 0x0bac
  cfw 0xd0db
  cfw 0x3552
  cfw 0xa6b0
  cfw 0x727f
  cfw 0x28e4
  cfw 0xe5cf
  cfw 0x163c
  cfw 0x3411
  cfw 0x8f07
  cfw 0xfab7
  cfw 0x0f34
  cfw 0xdabf
  cfw 0x6f6f
  cfw 0xc598
  cfw 0x00000001
  cfw 0x9a9a
  cfw 0xbd6a
  cfw 0x2136
  cfw 0x810a
  cfw 0x00000000
  cfw 0x8bce
  cfw 0x2ac4
  cfw 0xddce
  cfw 0x80000000
  cfw 0xc4fc
  cfw 0xfb2f
  cfw 0xee5f
  cfw 0xfd30
  cfw 0xc540
  cfw 0xd5f1
  cfw 0xbdad
  cfw 0x45c3
  cfw 0x708a
  cfw 0xa359
  cfw 0xf40d
  cfw 0xba06
  cfw 0xbace
  cfw 0xb447
  cfw 0x80000001
  cfw 0x899e
  cfw 0x8084
  cfw 0xbdb9
  cfw 0xa05a
  cfw 0xe225
  cfw 0xfb0c
  cfw 0xb2b2
  cfw 0xa4db
  cfw 0x8bf9
  cfw 0xFFFFFFFF
  cfw 0x7FFF087d
  cfw 0x5fcb
  cfw 0xa41a
  cfw 0x4109
  cfw 0x4522
  cfw 0x700f
  cfw 0x766d
  cfw 0x6f60
  cfw 0x8a5e
  cfw 0x9580
  cfw 0x70a3
  cfw 0xaea9
  cfw 0x711a
  cfw 0x6f81
  cfw 0x8f9a
  cfw 0x2584
  cfw 0xa599
  cfw 0x4015
  cfw 0xce81
  cfw 0xf55b
  cfw 0x399e
  cfw 0xa23f
  cfw 0x3588
  cfw 0x33ac
  cfw 0xbce7
  cfw 0x2a6b
  cfw 0x9fa1
  cfw 0xc94b
  cfw 0xc65b
  cfw 0x0068
  cfw 0xf499
  cfw 0x5f71
  cfw 0xd06f
  cfw 0x14df
  cfw 0x1165
  cfw 0xf88d
  cfw 0x4ba4
  cfw 0x2e74
  cfw 0x5c6f
  cfw 0xd11e
  cfw 0x9222
  cfw 0xacdb
  cfw 0x1038
  cfw 0xab17
  cfw 0xf7ce
  cfw 0x8a9e
  cfw 0x9aa3
  cfw 0xb495
  cfw 0x8a5e
  cfw 0xd859
  cfw 0x0bac
  cfw 0xd0db
  cfw 0x3552
  cfw 0xa6b0
  cfw 0x727f
  cfw 0x28e4
  cfw 0xe5cf
  cfw 0x163c
  cfw 0x3411
  cfw 0x8f07
  cfw 0xfab7
  cfw 0x0f34
  cfw 0xdabf
  cfw 0x6f6f
  cfw 0xc598
  cfw 0xf496
  cfw 0x9a9a
  cfw 0xbd6a
  cfw 0x2136
  cfw 0x810a
  cfw 0xca55
  cfw 0x8bce
  cfw 0x2ac4
  cfw 0xddce
  cfw 0xdd06
  cfw 0xc4fc
  cfw 0xfb2f
  cfw 0xee5f
  cfw 0xfd30
  cfw 0xc540
  cfw 0xd5f1
  cfw 0xbdad
  cfw 0x45c3
  cfw 0x708a
  cfw 0xa359
  cfw 0xf40d
  cfw 0xba06
  cfw 0xbace
  cfw 0xb447
  cfw 0x3f48
  cfw 0x899e
  cfw 0x8084
  cfw 0xbdb9
  cfw 0xa05a
  cfw 0xe225
  cfw 0xfb0c
  cfw 0xb2b2
  cfw 0xa4db
  cfw 0x8bf9
  cfw 0x12f7
  cfw 0x5fcb
  cfw 0xa41a
  cfw 0x4109
  cfw 0x4522
  cfw 0x700f
  cfw 0x766d
  cfw 0x6f60
  cfw 0x8a5e
  cfw 0x9580
  cfw 0x70a3
  cfw 0xaea9
  cfw 0x711a
  cfw 0x6f81
  cfw 0x8f9a
  cfw 0x2584
  cfw 0xa599
  cfw 0x4015
  cfw 0xce81
  cfw 0xf55b
  cfw 0x399e
  cfw 0xa23f
  cfw 0x3588
  cfw 0x33ac
  cfw 0xbce7
  cfw 0x2a6b
  cfw 0x9fa1
  cfw 0xc94b
  cfw 0xc65b
  cfw 0x0068
  cfw 0xf499
  cfw 0x5f71
  cfw 0xd06f
  cfw 0x14df
  cfw 0x1165
  cfw 0xf88d
  cfw 0x4ba4
  cfw 0xFFFFFFFE
  cfw 0x5c6f
  cfw 0xd11e
  cfw 0x9222
  cfw 0xacdb
  cfw 0x1038
  cfw 0xab17
  cfw 0xf7ce
  cfw 0x8a9e
  cfw 0x9aa3
  cfw 0xb495
  cfw 0x8a5e
  cfw 0xd859
  cfw 0x0bac
  cfw 0xd0db
  cfw 0x3552
  cfw 0xa6b0
  cfw 0x727f
  cfw 0x28e4
  cfw 0xe5cf
  cfw 0x163c
  cfw 0x3411
  cfw 0x8f07
  cfw 0xfab7
  cfw 0x0f34
  cfw 0xdabf
  cfw 0x6f6f
  cfw 0xc598
  cfw 0x00000001
  cfw 0x9a9a
  cfw 0xbd6a
  cfw 0x2136
  cfw 0x810a
  cfw 0x00000000
  cfw 0x8bce
  cfw 0x2ac4
  cfw 0xddce
  cfw 0x80000000
  cfw 0xc4fc
  cfw 0xfb2f
  cfw 0xee5f
  cfw 0xfd30
  cfw 0xc540
  cfw 0xd5f1
  cfw 0xbdad
  cfw 0x45c3
  cfw 0x708a
  cfw 0xa359
  cfw 0xf40d
  cfw 0xba06
  cfw 0xbace
  cfw 0xb447
  cfw 0x80000001
  cfw 0x899e
  cfw 0x8084
  cfw 0xbdb9
  cfw 0xa05a
  cfw 0xe225
  cfw 0xfb0c
  cfw 0xb2b2
  cfw 0xa4db
  cfw 0x8bf9
  cfw 0xFFFFFFFF
