`include "cpu_types_pkg.vh"

module alu (

	input logic [31:0] A,
	input logic [31:0] B,
	input logic [3:0] OPCODE,
	output logic [31:0] OUTPUT,
	output logic NEGATIVE,
	output logic OVERFLOW,
	output logic ZERO

);
	
	logic [32:0] tempa;
	logic [32:0] tempb;
	logic [32:0] tempo;


	assign tempa = {1'b0, A};
	assign tempb = {1'b0, B};

	always_comb
		begin

			OUTPUT = '0;
			tempo = '0;

			casez(OPCODE)
				4'b0000 :begin
						OUTPUT = A << B;
						tempo = tempa << tempb;
					end
				4'b0001:begin
						OUTPUT = A >> B;
						tempo = tempa >> tempb;
					end
				4'b0010:begin
						OUTPUT = A & B;
						tempo = tempa & tempb;
					end
				4'b0011:begin
						OUTPUT = A | B;
						tempo = tempa | tempb;
					end
				4'b0100:begin
						OUTPUT = A ^ B;
						tempo = tempa ^ tempb;
					end
				4'b0101:begin
						OUTPUT = ~(A | B);
						tempo = ~(tempa | tempb);
					end
				4'b0110:begin
						OUTPUT = A + B;
						tempo = tempa + tempb;
					end
				4'b0111:begin
						OUTPUT = A - B;
						tempo = tempa - tempb;
					end
				4'b1000:begin
						if ($signed(A) < $signed(B)) begin
							OUTPUT = 1;
						end else begin
							OUTPUT = 0;
						end
					end
				4'b1001:begin
						if ((A) < (B)) begin
							OUTPUT = 1;
						end else begin
							OUTPUT = 0;
						end
					end 		
				default: begin
					OUTPUT = OUTPUT;					
					tempo = tempo;
					end
			endcase
		end

		always_comb
		begin

			NEGATIVE = '0;
			OVERFLOW = '0;
			ZERO = '0;

			if (OUTPUT[31] == 1) begin
				NEGATIVE = 1;
			end 

			if (OUTPUT == '0) begin
				ZERO = 1;
			end 

			if (tempo[32]) begin
				OVERFLOW = 1;						
			end
		end 

endmodule
