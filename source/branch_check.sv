`include "cpu_types_pkg.vh"

module branch_check
(
        input logic flag, //1: BEQ, 0: BNE
	input logic zero,
        output logic out
 );

//For beq: out = 1 when flag = 1 and zero = 0
//For bne: out = 1 when flag = 0 and zero = 1
assign out = flag ^ zero; //XOR
   
endmodule
  
