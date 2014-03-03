ori $2, $0, 0xF0
ori $1, $0, 20
lw  $1, 0($2)
sw  $1, 4($2)
halt

org 0xF0

cfw 0xFFFF
