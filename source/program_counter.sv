`include "cpu_types_pkg.vh"
import cpu_types_pkg::*;

module program_counter 
(
	input logic CLK,
	input logic nrst,
	input 	    word_t pc_in,
        input logic halt, 
        input logic ihit,
	output 	    word_t pc_out
);
   word_t next_pc;

always_ff @(posedge CLK, negedge nrst)
  begin
     if(!nrst)
       begin
	  pc_out <= '0;
       end
     else if(!halt && ihit)
       begin
	  pc_out <= pc_in;
       end
     else
       begin
	  pc_out <= pc_out;
       end
  end // always_ff @

  // assign  = next_pc;
   
endmodule
