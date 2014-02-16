`include "register_file_if.vh"
`include "cpu_types_pkg.vh"

module if_id_latch (

	input logic CLK,
	input logic nRST,
	input [31:0] NPC,
	input [31:0] imemload,
	output [31:0] NPC_if_id_output,
	output [31:0] imemload_if_id_output

	);
	
	logic [31:0] temp_NPC;
	logic [31:0] temp_imemload;
	logic [31:0] temp_NPC_output;
	logic [31:0] temp_imemload_output;	

	assign NPC_if_id_output = temp_NPC_output;
	assign imemload_if_id_output = temp_imemload_output;

	always_ff @(posedge CLK, negedge nRST)
		begin: IFIDLATCH
			if (nRST == 0) begin
				temp_NPC_output <= '0;
				temp_imemload_output <= '0;
			end else begin
				temp_NPC_output <= NPC;
				temp_imemload_output <= imemload;
			end
		end

		
endmodule	
	


	
	

