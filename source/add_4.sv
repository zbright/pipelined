`include "cpu_types_pkg.vh"
import cpu_types_pkg::*;
module add_4 
(
	input word_t pc_in,
	output word_t next_pc
);

   always_comb
     begin
	next_pc = pc_in + 32'h00000004;
     end
   
endmodule
