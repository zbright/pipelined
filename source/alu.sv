`include "cpu_types_pkg.vh"
import cpu_types_pkg::*;
module alu
(
 input logic [3:0]  aluOP,
 input 	      word_t pA, pB,
 output       word_t out,
 output logic neg_flag, overflow_flag, zero_flag 
 );

logic [32:0] temp_out;

  always_comb
    begin
     temp_out[32:0] = '0;
     out[31:0] = '0;  
     neg_flag = 0;
     overflow_flag = 0;
     zero_flag = 0;
     
       
     casez(aluOP)
       4'b0000: //SLL
	 begin
	    out = pA << pB;
	 end
       4'b0001://SRL
	 begin
	    out = pA >> pB;
	 end
       4'b0010://ADD
	 begin
	    temp_out = ($signed(pA) + $signed(pB));

	    //From http://teaching.idallen.com/dat2343/10f/notes/040_overflow.txt
	    if(pA[31] == 1 && pB[31] == 1) //Both negative
	      begin
		 if(temp_out[31] == 0)
		   begin
		      overflow_flag = 1;
		   end
	      end
	    else if(pA[31] == 0 && pB[31] == 0)
	      begin
		 if(temp_out[31] == 1)
		   begin
		      overflow_flag = 1;
		   end
	      end
	    out = temp_out[31:0];

	    if($signed(out) < 0)
	      begin
		 neg_flag = 1;
	      end
	 end
       4'b0011://SUB
	 begin
	    out = ($signed(pA) - $signed(pB));
	    if($signed(out) < 0)
	      begin
		 neg_flag = 1;
	      end
	 end
       4'b0100://AND
	 begin
	    out = pA & pB;
	 end
       4'b0101://OR
	 begin
	    out = pA | pB;
	 end
       4'b0110://XOR
	 begin
	    out = pA ^ pB;
	 end
       4'b0111://NOR
	 begin
	     out = ~(pA | pB);
	 end
       4'b1000://SLT
	 begin
	    out = ($signed(pA) < $signed(pB));
	 end
       4'b1001://SLTU
	 begin
	    out = ($unsigned(pA) < $unsigned(pB));
	 end
     endcase

     if(out == 0)
       begin
	  zero_flag = 1;
       end
     
    end
endmodule // alu

