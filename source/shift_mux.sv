module shift_mux
(
 input logic [31:0]  readReg1,
 input logic [31:0] readReg2,
 input logic  shift,
 output logic [31:0] out
 );

   assign out = !shift ? readReg1 : readReg2;

endmodule
