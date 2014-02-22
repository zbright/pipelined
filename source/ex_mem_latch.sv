`include "register_file_if.vh"
`include "cpu_types_pkg.vh"

module ex_mem_latch (
		     input logic 	          CLK,
		     input logic 	          nRST,
		     input logic [1:0] 	      memtoreg_in,
		     input logic 	          regwrite_in,
		     input logic [1:0] 	      pcselect_in,
		     input logic 	          branchSelect_in,
		     input logic 	          dmemREN_in,
		     input logic 	          dmemWEN_in,
		     input logic 	          halt_in,
		     input logic [31:0]       rdat1_in,
		     input logic [31:0]       rdat2_in,
		     input logic [31:0]       npc_in,
		     input logic 	          zeroFlag_in,
		     input logic [31:0]       aluResult_in,
		     input logic [4:0] 	      branchDest_in,
		     input logic [31:0]       upper16_in,
		     input logic [31:0]       signZero_in,
		     input logic [31:0]       iMemLoad_in,
		     input logic 	          dhit,
             input logic              flush,
		     output logic [1:0]       memtoreg,
		     output logic 	          regwrite,
		     output logic [1:0]       pcselect,
		     output logic 	          branchSelect,
		     output logic 	          dmemREN,
		     output logic 	          dmemWEN,
		     output logic 	          halt_out,
		     output logic [31:0]      rdat1,
		     output logic [31:0]      rdat2,
		     output logic [31:0]      npc,
		     output logic 	          zeroFlag,
		     output logic [31:0]      aluResult,
		     output logic [4:0]       branchDest,
		     output logic [31:0]      upper16,
		     output logic [31:0]      signZero,
		     output logic [31:0]      iMemLoad
);

    logic [1:0] 			temp_memtoreg;
    logic 				    temp_regwrite;
    logic [1:0] 			temp_pcselect;
    logic 				    temp_branchSelect;
    logic 				    temp_dmemREN;
    logic 				    temp_dmemWEN;
    logic 				    temp_halt_out;
    logic [31:0] 			temp_rdat1;
    logic [31:0] 			temp_rdat2;
    logic [31:0] 			temp_npc;
    logic 				    temp_zeroFlag;
    logic [31:0] 			temp_aluResult;
    logic [4:0] 			temp_branchDest;
    logic [31:0] 			temp_upper16;
    logic [31:0] 			temp_signZero;
    logic [31:0]            temp_iMemLoad;

	always_ff @(posedge CLK, negedge nRST)
	  begin: WRITE
			if (~nRST) begin
			   temp_memtoreg <= '0;
			   temp_regwrite <= '0;
			   temp_pcselect <= '0;
			   temp_branchSelect <= '0;
			   temp_halt_out <= '0;
			   temp_rdat1 <= '0;
			   temp_rdat2 <= '0;
			   temp_npc <= '0;
			   temp_zeroFlag <= '0;
			   temp_aluResult <= '0;
			   temp_branchDest <= '0;
			   temp_upper16 <= '0;
			   temp_signZero <= '0;
			   temp_iMemLoad <= '0;
               temp_dmemREN <= '0;
               temp_dmemWEN <= '0;
            end else if(flush) begin
               temp_memtoreg <= '0;
               temp_regwrite <= '0;
               temp_pcselect <= '0;
               temp_branchSelect <= '0;
               temp_halt_out <= '0;
               temp_rdat1 <= '0;
               temp_rdat2 <= '0;
               temp_npc <= '0;
               temp_zeroFlag <= '0;
               temp_aluResult <= '0;
               temp_branchDest <= '0;
               temp_upper16 <= '0;
               temp_signZero <= '0;
               temp_iMemLoad <= '0;
               temp_dmemREN <= '0;
               temp_dmemWEN <= '0;
			end else  begin
			   temp_dmemREN <= dmemREN_in;
			   temp_dmemWEN <= dmemWEN_in;
			   temp_memtoreg <= memtoreg_in;
			   temp_regwrite <= regwrite_in;
			   temp_pcselect <= pcselect_in;
			   temp_branchSelect <= branchSelect_in;
			   temp_halt_out <= halt_in;
			   temp_rdat1 <= rdat1_in;
			   temp_rdat2 <= rdat2_in;
			   temp_npc <= npc_in;
			   temp_zeroFlag <= zeroFlag_in;
			   temp_aluResult <= aluResult_in;
			   temp_branchDest <= branchDest_in;
			   temp_upper16 <= upper16_in;
			   temp_signZero <= signZero_in;
			   temp_iMemLoad <= iMemLoad_in;
			end


		end

   assign memtoreg = temp_memtoreg;
   assign regwrite = temp_regwrite;
   assign pcselect = temp_pcselect;
   assign branchSelect = temp_branchSelect;
   assign dmemREN = temp_dmemREN;
   assign dmemWEN = temp_dmemWEN;
   assign halt_out = temp_halt_out;
   assign rdat1 = temp_rdat1;
   assign rdat2 = temp_rdat2;
   assign npc = temp_npc;
   assign zeroFlag = temp_zeroFlag;
   assign aluResult = temp_aluResult;
   assign branchDest = temp_branchDest;
   assign upper16 = temp_upper16;
   assign signZero = temp_signZero;
   assign iMemLoad = temp_iMemLoad;

endmodule



