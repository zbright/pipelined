`include "register_file_if.vh"
`include "cpu_types_pkg.vh"

module mem_wb_latch (
		     input logic 	 CLK,
		     input logic 	 nRST,
		     input logic [1:0] 	 memtoreg_in,
		     input logic [1:0] 	 pcselect_in,
		     input logic 	 regwrite_in,
		     input logic [31:0]  npc_in,
		     input logic [31:0]  aluResult_in,
		     input logic [4:0] 	 branchDest_in,
		     input logic [31:0]  upper16_in,
		     input logic [31:0]  dMemLoad_in,
             input logic [31:0]  imemload_in,
		     output logic [1:0]  memtoreg,
		     output logic 	 regwrite,
		     output logic [1:0]  pcselect,
		     output logic [31:0] npc,
		     output logic [31:0] aluResult,
		     output logic [4:0]  branchDest,
		     output logic [31:0] upper16,
		     output logic [31:0] dMemLoad,
             output logic [31:0] imemload
);

   logic [1:0] 				 temp_memtoreg;
   logic 				     temp_regwrite;
   logic [2:0] 				 temp_pcselect;
   logic [31:0] 			 temp_npc;
   logic [31:0] 			 temp_aluResult;
   logic [4:0] 				 temp_branchDest;
   logic [31:0] 			 temp_upper16;
   logic [31:0] 			 temp_dMemLoad;
   logic [31:0]              temp_imemload;


	always_ff @(posedge CLK, negedge nRST)
		begin: WRITE
			if (nRST == 0) begin
			   temp_memtoreg <= '0;
			   temp_regwrite <= '0;
			   temp_pcselect <= '0;
			   temp_npc <= '0;
			   temp_aluResult <= '0;
			   temp_branchDest <= '0;
			   temp_upper16 <= '0;
			   temp_dMemLoad <= '0;
               temp_imemload <= '0;
			end else begin // if (nRST == 0)
			   temp_memtoreg <= memtoreg_in;
			   temp_regwrite <= regwrite_in;
			   temp_pcselect <= pcselect_in;
			   temp_npc <= npc_in;
			   temp_aluResult <= aluResult_in;
			   temp_branchDest <= branchDest_in;
			   temp_upper16 <= upper16_in;
			   temp_dMemLoad <= dMemLoad_in;
               temp_imemload <= imemload_in;
			end
		end

   assign memtoreg = temp_memtoreg;
   assign regwrite = temp_regwrite;
   assign pcselect = temp_pcselect;
   assign npc = temp_npc;
   assign aluResult = temp_aluResult;
   assign branchDest = temp_branchDest;
   assign upper16 = temp_upper16;
   assign dMemLoad = temp_dMemLoad;
   assign imemload = temp_imemload;
endmodule


