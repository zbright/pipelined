ORG 	0x0000
ORI		$1,$1,0xF0
LW		$2,0($1)
BNE		$1,$0,works
SW		$1,0($1)

works:
HALT
