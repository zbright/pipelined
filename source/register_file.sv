`include "register_file_if.vh"
`include "cpu_types_pkg.vh"

module register_file 
(
	input logic CLK,
	input logic nrst,
	register_file_if.rf rfif	
);

   logic [31:0] [31:0] registers;
   
   always_ff @(posedge CLK, negedge nrst)
     begin
	if(!nrst)
          begin
	     registers[31:0] <= '0;
	  end
	else
	  begin
	     if(rfif.WEN)
	       begin
		  if(rfif.wsel)
		  begin
		     registers[rfif.wsel] <= rfif.wdat;		  
	          end
	       end
	  end
     end

   always_comb
      begin
	 rfif.rdat1 = registers[rfif.rsel1];
	 rfif.rdat2 = registers[rfif.rsel2];    
      end
endmodule
	
