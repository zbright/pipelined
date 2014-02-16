module alu_source_mux
(
 input logic [31:0]  readReg2,
 input logic [31:0]  extendedImmediate,
 input logic [4:0]   shiftAmount,
 input logic [1:0]   aluSource,
 output logic [31:0] out
 );

   always_comb
     begin
	casez (aluSource)
	  0:
	    begin
	       out = readReg2;
	    end
	  1:
	    begin
	       out = extendedImmediate;
	    end
	  2:
	    begin
	       out = {{27{1'b0}},shiftAmount};
	    end
	  default:
	    begin
	       out = readReg2;
	    end
	  endcase
     end
endmodule
