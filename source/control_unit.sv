`include "datapath_cache_if.vh"
`include "cpu_types_pkg.vh"

module control_unit(
	output logic [1:0] ALUsrc,
	output logic [1:0] memtoreg,
	output logic signzero,
	output logic [3:0] ALUop,	
	output logic regwrite,
	output logic [2:0] pcselect,
	output logic [1:0] regdst,
	output logic branch,
	output logic request_dmemREN,
	output logic request_dmemWEN,
	output logic halt_out,
	input logic [31:0] imemload
	//datapath_cache_if.dp dpif
	);


	import cpu_types_pkg::*;
	
	logic [5:0] opcode;
	logic [4:0] shiftcode;
	logic [5:0] functioncode;
	logic flag;
	
	assign opcode = imemload[31:26];
	assign shiftcode = imemload[25:21];
	assign functioncode = imemload[5:0];

	always_comb
	begin
		halt_out = 0;		
		if ((opcode == 6'b111111)&&(functioncode == 6'b111111)) begin
			halt_out = 1;
		end
	end

	always_comb
	begin

		ALUsrc = 0;
		memtoreg = 0;
		signzero = 0;
		ALUop = 0;
		//JAL = 0;
		regwrite = 0;
		pcselect = 0;
		regdst = 0;
		branch = 0;
		request_dmemWEN = 0;
		request_dmemREN = 0;

		if (opcode == 6'b000000) begin

			casez(functioncode)
				6'b100001 :begin
					//ADDU
					ALUop = 4'b0110;
					regwrite = 1;
					pcselect = 0;
					regdst = 1;
				end
				6'b100100 :begin
					//AND
					ALUop = 4'b0010;
					regwrite = 1;
					pcselect = 0;
					regdst = 1;
				end
				6'b001000 :begin
					//JR
					pcselect = 1;
				end
				6'b100111 :begin
					//NOR
					ALUop = 4'b0101;
					regwrite = 1;
					pcselect = 0;
					regdst = 1;
				end
				6'b100101 :begin
					//OR
					ALUop = 4'b0011;
					regwrite = 1;
					pcselect = 0;
					regdst = 1;
				end
				6'b101010 :begin
					//SLT
					ALUop = 4'b1000;
					regwrite = 1;
					pcselect = 0;
					regdst = 1;
				end
				6'b101011 :begin
					//SLTU
					ALUop = 4'b1001;
					regwrite = 1;
					pcselect = 0;
					regdst = 1;
				end
				6'b000000 :begin
					//SLL
					ALUsrc = 2;
					ALUop = 4'b0000;
					regwrite = 1;
					pcselect = 0;
					regdst = 1;
				end
				6'b000010 :begin
					//SRL
					ALUsrc = 2;
					ALUop = 4'b0001;
					regwrite = 1;
					pcselect = 0;
					regdst = 1;
				end
				6'b100011 :begin
					//SUBU
					ALUop = 4'b0111;
					regwrite = 1;
					pcselect = 0;
					regdst = 1;
				end
				6'b100110 :begin
					//XOR
					ALUop = 4'b0100;
					regwrite = 1;
					pcselect = 0;
					regdst = 1;
				end
			endcase	

		end else begin
		//I instruction and J instruction format
			casez(opcode)
				6'b001001 :begin
					//ADDIU
					ALUsrc = 1;
					signzero = 1;
					ALUop = 4'b0110;
					regwrite = 1;
					pcselect = 0;
				end
				6'b001100 :begin
					//ANDI
					ALUsrc = 1;
					ALUop = 4'b0010;
					regwrite = 1;
					pcselect = 0;
				end
				6'b000100 :begin
					//BEQ
					ALUop = 4'b0111;
					//not entirely sure
					branch = 1;
					signzero = 1;
					pcselect = 2;
				end
				6'b000101 :begin
					//BNE
					ALUop = 4'b0111;	
					branch = 0;	
					//not entirely sure
					signzero = 1;
					pcselect = 2;			
				end
				6'b001111 :begin
					//LUI
					memtoreg = 2;
					regwrite = 1;
					pcselect = 0;
				end
				6'b100011 :begin
					//LW
					request_dmemREN = 1;
					ALUsrc = 1;
					memtoreg = 1;
					signzero = 1;
					ALUop = 4'b0110;
					regwrite = 1;
					pcselect = 0;
				end
				6'b001101 :begin
					//ORI
					ALUsrc = 1;
					signzero = 0;
					ALUop = 4'b0011;
					regwrite = 1;
					pcselect = 0;
				end
				6'b001010 :begin
					//SLTI
					ALUsrc = 1;
					signzero = 1;
					ALUop = 4'b1000;
					regwrite = 1;
					pcselect = 0;
				end
				6'b001011 :begin
					//SLTU
					ALUsrc = 1;
					signzero = 1;
					ALUop = 4'b1001;
					regwrite = 1;
					pcselect = 0;
				end
				6'b101011 :begin
					//SW
					request_dmemWEN = 1;
					ALUsrc = 1;
					signzero = 1;
					ALUop = 4'b0110;
					pcselect = 0;
				end
				6'b001110 :begin
					//XORI
					ALUsrc = 1;
					ALUop = 4'b0100;
					regwrite = 1;
					pcselect = 0;
				end
				6'b000010 :begin
					//J
					pcselect = 3;
				end
				6'b000011 :begin
					//JAL
					memtoreg = 3;
					regwrite = 1;
					pcselect = 3;
					regdst = 2;
				end
			endcase	
		end
	end
		


endmodule 
	
