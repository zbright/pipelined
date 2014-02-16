`include "cpu_types_pkg.vh"

module extender
(
 input logic [15:0] immediate,
 input logic extend_code,
 output cpu_types_pkg::word_t extended_imm
);

always_comb
  begin    
     casez(extend_code)
       1'b0://Zero
	 begin
	    extended_imm = {16'h0000, immediate};
	 end
       1'b1: //Sign
	 begin
	    extended_imm ={{16{immediate[15]}}, immediate};
	 end
       endcase
  end // always_comb
endmodule

   
   
