module request_unit 
(
	input logic  dWEN_in,
	input logic  dREN_in,
	input logic  dhit,
	input logic  CLK,
	output logic dWEN_out,
        output logic dREN_out 
);

always_ff @(posedge CLK)
  begin
     if(dhit)
       begin
	  dWEN_out <= 0;
	  dREN_out <= 0;
       end
     else
       begin
	  dWEN_out <= dWEN_in;
	  dREN_out <= dREN_in;
       end
  end


   
endmodule
