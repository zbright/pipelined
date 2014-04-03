`include "cpu_types_pkg.vh"

module program_count(
	input logic CLK,
	input logic nRST,
	input logic [31:0] next_pc_count,
	input logic wen,
	input logic [31:0] pc_init,
	output logic [31:0] current_pc_count
	);

	logic [31:0] pccount;

	assign current_pc_count = pccount;

	import cpu_types_pkg::*;


	 always_ff @(posedge CLK, negedge nRST)
		begin: PC
			if (nRST == 0) begin
				pccount <= pc_init;
			end else if (wen) begin
				pccount <= next_pc_count;
			end
		end
endmodule
