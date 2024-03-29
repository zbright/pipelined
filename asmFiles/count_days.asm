ORG 	0x0000
ORI 	$sp,$zero,0xFFFC

ORI 	$s4,$zero,0x0014
ORI 	$s5,$zero,0x0001
ORI	$s6,$zero,0x07DE

PUSH 	$s4				#day
PUSH 	$s5				#month
PUSH 	$s6				#year

#begin Calculate Days
ORI 	$s7,$zero,0x0000 		#output
POP	$s6
POP	$s5
POP	$s4

ADDIU	$s5,$s5,0xFFFF			#CurrentMonth - 1
ADDIU	$s6,$s6,0xF830			#CurrentYear - 2000

#365 * (CurrentYear - 2000)
PUSH	$s6
ORI	$s6,$zero,0x016D
PUSH	$s6				#365
JAL	mult
POP 	$s6

#30 * (CurrentMonth - 1)
PUSH	$s5
ORI	$s5,$zero,0x001E
PUSH	$s5				#30
JAL	mult
POP	$s5

#CurrentDay+(30⋅(CurrentMonth-1))+365⋅(CurrentYear-2000)
ADDU	$s7,$s4,$s5
ADDU	$s7,$s7,$s6

PUSH	$s7
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
