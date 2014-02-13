`include "cpu_types_pkg.vh"
import cpu_types_pkg::*;
module add_32 
(
	input  word_t next_pc,
	input  word_t branch_addr,
	output word_t pc_out
);

   always_comb
     begin
	pc_out = next_pc + branch_addr;
     end

endmodule
