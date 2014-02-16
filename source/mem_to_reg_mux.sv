module mem_to_reg_mux
(
 input logic [31:0]  aluOut,
 input logic [31:0]  dload,
 input logic [31:0]  shiftedImmediate,
 input logic [31:0]  npc,
 input logic [1:0]   memToReg,
 output logic [31:0] out
 );

   always_comb
     begin
	casez (memToReg)
	  0:
	    begin
	       out = aluOut;
	    end
	  1:
	    begin
	       out = dload;
	    end
	  2:
	    begin
	       out = shiftedImmediate;
	    end
	  3:
	    begin
	       out = npc;
	    end
	  default:
	    begin
	       out = aluOut;
	    end
	  endcase
     end
endmodule
