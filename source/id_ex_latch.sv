`include "register_file_if.vh"
`include "cpu_types_pkg.vh"

module id_ex_latch (
	input 		    CLK,
	input 		    nRST,
	input logic [1:0]   ALUsrc,
	input logic [1:0]   memtoreg,
	input logic [3:0]   ALUop,
	input logic 	    regwrite,
	input logic [1:0]   pcselect,
	input logic [1:0]   regdst,
	input logic 	    branch,
	input logic 	    request_dmemREN,
	input logic 	    request_dmemWEN,
	input logic 	    halt_out,
	input logic [31:0]  NPC,
	input logic [31:0]  rdat_one,
	input logic [31:0]  rdat_two,
	input logic [31:0]  imemload,
	input logic [31:0]  uppersixteen,
	input logic [31:0]  signzerovalue,
	input logic 	    wen,
	input logic 		flush,
	input logic 		dhit,
	output logic [1:0]  ALUsrc_id_ex_output,
	output logic [1:0]  memtoreg_id_ex_output,
	output logic [3:0]  ALUop_id_ex_output,
	output logic 	    regwrite_id_ex_output,
	output logic [1:0]  pcselect_id_ex_output,
	output logic [1:0]  regdst_id_ex_output,
	output logic 	    branch_id_ex_output,
	output logic 	    request_dmemREN_id_ex_output,
	output logic 	    request_dmemWEN_id_ex_output,
	output logic 	    halt_out_id_ex_output,
	output logic [31:0] NPC_id_ex_output,
	output logic [31:0] rdat_one_id_ex_output,
	output logic [31:0] rdat_two_id_ex_output,
	output logic [31:0] imemload_id_ex_output,
	output logic [31:0] uppersixteen_id_ex_output,
	output logic [31:0] signzerovalue_id_ex_output

	);

	logic [1:0] temp_ALUsrc_output;
	logic [1:0] temp_memtoreg_output;
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


	assign ALUsrc_id_ex_output = temp_ALUsrc_output;
	assign memtoreg_id_ex_output = temp_memtoreg_output;
	assign ALUop_id_ex_output = temp_ALUop_output;
	assign regwrite_id_ex_output = temp_regwrite_output;
	assign pcselect_id_ex_output = temp_pcselect_output;
	assign regdst_id_ex_output = temp_regdst_output;
	assign branch_id_ex_output = temp_branch_output;
	assign request_dmemREN_id_ex_output = temp_request_dmemREN_output;
	assign request_dmemWEN_id_ex_output = temp_request_dmemWEN_output;
	assign halt_out_id_ex_output = temp_halt_out_output;
	assign NPC_id_ex_output = temp_NPC_output;
	assign rdat_one_id_ex_output = temp_rdat_one_output;
	assign rdat_two_id_ex_output = temp_rdat_two_output;
	assign imemload_id_ex_output = temp_imemload_output;
	assign uppersixteen_id_ex_output = temp_uppersixteen_output;
	assign signzerovalue_id_ex_output = temp_signzerovalue_output;

	always_ff @(posedge CLK, negedge nRST)
		begin
			if (nRST == 0) begin
				temp_ALUsrc_output <= 0;
				temp_memtoreg_output <= 0;
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
			end else if(flush) begin
				temp_ALUsrc_output <= 0;
				temp_memtoreg_output <= 0;
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
			end else if(wen) begin
				temp_ALUsrc_output <= ALUsrc;
				temp_memtoreg_output <= memtoreg;
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






