`timescale 1 ns / 1 ns
module alu_tb ();

	logic [31:0] A;
	logic [31:0] B;
	logic [3:0] OPCODE;
 	logic [31:0] OUTPUT;
	logic NEGATIVE;
	logic OVERFLOW;
	logic ZERO;

	
	parameter PERIOD = 10;

	alu DUT( .A (A),
		 .B (B),
		 .OPCODE (OPCODE),
		 .OUTPUT (OUTPUT),
		 .NEGATIVE (NEGATIVE),
		 .OVERFLOW (OVERFLOW),
		 .ZERO (ZERO)
		);

	initial begin
		A = 1;
		B = 2;
		OPCODE = 4'b0000;
		#10
		OPCODE = 4'b0001;
		A = 32'hFFFFFFFF;
		B = 32'hFFFFFFFF;
		#10
		OPCODE = 4'b0010;		
		#10
		OPCODE = 4'b0011;
		#10
		OPCODE = 4'b0100;
		#10
		OPCODE = 4'b0101;
		#10
		OPCODE = 4'b0110;
		#10
		OPCODE = 4'b0111;
		A = 30;
		B = 31;
		#10
		OPCODE = 4'b1000;
		#10
		OPCODE = 4'b1001;
	end

endmodule
