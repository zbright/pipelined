ORG 	0x0000
ORI 	$sp,$zero,0xFFFC

ORI 	$s4,$zero,0x000A
ORI 	$s5,$zero,0x0002

PUSH 	$s4
PUSH 	$s5
PUSH 	$s4
PUSH 	$s5
PUSH 	$s4

ORI 	$s6,$zero,0x0000 	#counter
ORI	$s7,$zero,0x0004

mult_loop:
	BEQ	$s7,$s6,mult_end
	JAL	mult
	ADDIU 	$s6,$s6,0x0001 		#increment counter
	J	mult_loop

mult_end:
	HALT



mult:
	POP 	$s0 			#multiplier
	POP 	$s1 			#multiplicand
	ORI 	$s2,$zero,0x0000 	#counter
	ORI 	$s3,$zero,0x0000 	#output
	
loop:
	BEQ 	$s1,$s2,end 		#if counter == multiplicand, then end
	ADDU 	$s3,$s3,$s0 		#Add the multiplier to the output
	ADDIU 	$s2,$s2,0x0001 		#increment counter
	J 	loop	
end:	
	PUSH 	$s3
	JR	$ra			#jump to return address

