`include "cpu_types_pkg.vh"

module program_count(
	input logic CLK,
	input logic nRST,
	input logic ihit,
	input logic halt,
	input logic [31:0] next_pc_count,
	output logic [31:0] current_pc_count
	);

	logic [31:0] pccount;

	assign current_pc_count = pccount;

	import cpu_types_pkg::*;


	 /*always_ff @(posedge CLK, negedge nRST)
		begin: PC
			if (nRST == 0) begin
				pccount <= '0;
			end else begin
				pccount <= next_pc_count;
			end
		end */

	 always_ff @(posedge CLK, negedge nRST)
		begin: PC
			if (nRST == 0) begin
				pccount <= '0;
			end else if ((ihit == 1) && (halt != 1)) begin
				pccount <= next_pc_count;
			end else begin
				pccount <= pccount;
			end
		end
endmodule
