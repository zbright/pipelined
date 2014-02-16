module next_pc_mux
(
 input logic [31:0]  pcPlus4,
 input logic [31:0]  jumpRegPC,
 input logic [31:0]  branchPC,
 input logic [31:0]  jumpPC,
 input logic [1:0]   nextPCSelect,
 output logic [31:0] out
 );

   always_comb
     begin
	casez (nextPCSelect)
	  0:
	    begin
	       out = pcPlus4;
	    end
	  1:
	    begin
	       out = jumpRegPC;
	    end
	  2:
	    begin
	       out = branchPC;
	    end
	  3:
	    begin
	       out = jumpPC;
	    end
	  endcase
     end
endmodule
