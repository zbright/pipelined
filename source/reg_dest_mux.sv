module reg_dest_mux
(
 input logic [4:0]  rt,
 input logic [4:0]  rd,
 input logic [1:0] regDest,
 output logic [4:0] out
 );

   always_comb
     begin
	casez (regDest)
	  0:
	    begin
	       out = rt;
	    end
	  1:
	    begin
	       out = rd;
	    end
	  2:
	    begin
	       out = 31;
	    end
	  default:
	    begin
	       out = rd;
	    end
	  endcase
     end
endmodule // reg_dest_mux
