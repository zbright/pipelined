module branch_mux
(
 input logic [31:0]  nextPC,
 input logic [31:0]  branchPC,
 input logic 	     branchSelect,
 output logic [31:0] out
 );

   assign out = !branchSelect ? nextPC : branchPC;

endmodule
