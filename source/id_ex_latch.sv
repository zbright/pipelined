`include "register_file_if.vh"
`include "cpu_types_pkg.vh"

module if_ex_latch (

	input logic [1:0] ALUsrc,
	input logic [1:0] memtoreg,
	input logic signzero,
	input logic [3:0] ALUop,	
	input logic regwrite,
	input logic [2:0] pcselect,
	input logic [1:0] regdst,
	input logic branch,
	input logic request_dmemREN,
	input logic request_dmemWEN,
	input logic halt_out,
	input logic [31:0] NPC,
	input logic [31:0] rdat_one,
	input logic [31:0] rdat_two,
	input logic [31:0] imemload,
	input logic [31:0] uppersixteen,
	input logic [31:0] signzerovalue,
	output logic [1:0] ALUsrc_if_ex_output,
	output logic [1:0] memtoreg_if_ex_output,
	output logic signzero_if_ex_output,
	output logic [3:0] ALUop_if_ex_output,	
	output logic regwrite_if_ex_output,
	output logic [2:0] pcselect_if_ex_output,
	output logic [1:0] regdst_if_ex_output,
	output logic branch_if_ex_output,
	output logic request_dmemREN_if_ex_output,
	output logic request_dmemWEN_if_ex_output,
	output logic halt_out_if_ex_output,
	output logic [31:0] NPC_if_ex_output,
	output logic [31:0] rdat_one_if_ex_output,
	output logic [31:0] rdat_two_if_ex_output,
	output logic [31:0] imemload_if_ex_output,
	output logic [31:0] uppersixteen_if_ex_output,
	output logic [31:0] signzerovalue_if_ex_output

	);
	
	logic [1:0] temp_ALUsrc_output;
	logic [1:0] temp_memtoreg_output;
	logic temp_signzero_output;
	logic [3:0] temp_ALUop_output;
	logic temp_regwrite_output;
 	logic [2:0] temp_pcselect_output;
	logic [1:0] temp_regdst_output;
	logic temp_branch_output;
	logic temp_request_dmemREN_output;
	logic temp_request_dmemWEN_output;
	logic temp_halt_out_output;
	logic [31:0] temp_NPC_output;
	logic [31:0] temp_rdat_one_output;
	logic [31:0] temp_rdat_two_output;
	logic [31:0] temp_imemload_output;
	logic [31:0] temp_uppersixteen_output;
	logic [31:0] temp_signzerovalue_output;


	assign ALUsrc_if_ex_output = temp_ALUsrc_output;
	assign memtoreg_if_ex_output = temp_memtoreg_output;
	assign signzero_if_ex_output = temp_signzero_output;
	assign ALUop_if_ex_output = temp_ALUop_output;
	assign regwrite_if_ex_output = temp_regwrite_output;
	assign pcselect_if_ex_output = temp_pcselect_output;
	assign regdst_if_ex_output = temp_regdst_output;
	assign branch_if_ex_output = temp_branch_output;
	assign request_dmemREN_if_ex_output = temp_request_dmemREN_output;
	assign request_dmemWEN_if_ex_output = temp_request_dmemWEN_output;
	assign halt_out_if_ex_output = temp_halt_out_output;
	assign NPC_if_ex_output = temp_NPC_output;
	assign rdat_one_if_ex_output = temp_rdat_one_output;
	assign rdat_two_if_ex_output = temp_rdat_two_output;
	assign imemload_if_ex_output = temp_imemload_output;
	assign uppersixteen_if_ex_output = temp_uppersixteen_output;
	assign signzerovalue_if_ex_output = temp_signzerovalue_output;
	

	always_ff @(posedge CLK, negedge nRST)
		begin: IFexLATCH
			if (nRST == 0) begin
				temp_ALUsrc_output <= 0;
				temp_memtoreg_output <= 0;
				temp_signzero_output <= 0;
				temp_ALUop_output <= 0;
				temp_regwrite_output <= 0;
 				temp_pcselect_output <= 0;
				temp_regdst_output <= 0;
				temp_branch_output <= 0;
				temp_request_dmemREN_output <= 0;
				temp_request_dmemWEN_output <= 0;
				temp_halt_out_output <= 0;
				temp_NPC_output <= 0;
				temp_rdat_one_output <= 0;
				temp_rdat_two_output <= 0;
				temp_imemload_output <= 0;
				temp_uppersixteen_output <= 0;
				temp_signzerovalue_output <= 0;
			end else begin
				temp_ALUsrc_output <= ALUsrc;
				temp_memtoreg_output <= memtoreg;
				temp_signzero_output <= signzero;
				temp_ALUop_output <= ALUop;
				temp_regwrite_output <= regwrite;
 				temp_pcselect_output <= pcselect;
				temp_regdst_output <= regdst;
				temp_branch_output <= branch;
				temp_request_dmemREN_output <= request_dmemREN;
				temp_request_dmemWEN_output <= request_dmemWEN;
				temp_halt_out_output <= halt_out;
				temp_NPC_output <= NPC;
				temp_rdat_one_output <= rdat_one;
				temp_rdat_two_output <= rdat_two;
				temp_imemload_output <= imemload;
				temp_uppersixteen_output <= uppersixteen;
				temp_signzerovalue_output <= signzerovalue;
			end
		end

		
endmodule	
	


	
	

