ORG 	0x0000
ORI 	$sp,$zero,0xFFFC
ORI 	$s4,$zero,0x000C
ORI 	$s5,$zero,0x000C

PUSH 	$s4
PUSH 	$s5

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
	HALT

	
		
