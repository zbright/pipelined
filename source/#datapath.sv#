/*
  Eric Villasenor
  evillase@gmail.com

  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// data path interface
`include "datapath_cache_if.vh"

//register interface
`include "register_file_if.vh"

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

module datapath (
  input logic CLK, nRST,
  datapath_cache_if.dp dpif
);
	// import types
 	import cpu_types_pkg::*;

	// interface
	register_file_if                            registerval ();

	//signals for register file
	logic [31:0] read_data_one_output;
	logic [31:0] read_data_two_output;
	logic [31:0] write_register_location;
	logic [31:0] write_register_value;
	//signals for PC
  	logic [31:0] next_pc_count;
  	logic [31:0] current_pc_count;
	//signals for control unit
	logic [1:0] ALUsrc;
	logic [1:0] memtoreg;
	logic shift;
	logic signzero;
	logic [3:0] ALUop;	
	logic JAL;
	logic regwrite;
	logic [1:0] pcselect;
	logic [1:0] regdst;
	logic branch;
	logic request_dmemREN;
	logic request_dmemWEN;
	logic request_dmemREN_output;
	logic request_dmemWEN_output;
	//signals for ALU
	logic [31:0] alu_input_one;
	logic [31:0] alu_input_two;
	logic [3:0] ALU_OPCODE;
	logic [31:0] ALU_OUTPUT;
	logic ALU_NEGATIVE;
	logic ALU_OVERFLOW;
	logic ALU_ZERO;
	//signal for signzero
	logic [31:0] signzero_output;
	//signal for memtoreg mux
	logic [31:0] writedata_output;
	//pccount + 4 output
	logic [31:0] pc_count_four_output;
	//branch address calculate
	logic [31:0] branch_count_output;
	//branch xnor output
	logic branch_xnor_output;
	//branch mux
	logic [31:0] branch_mux_output;
	//ifid
	logic [31:0] NPC_if_id_output;
	logic [31:0] imemload_if_id_output;
	//idex signals
	logic [1:0] ALUsrc_id_ex_output;
	logic [1:0] memtoreg_id_ex_output;
	logic signzero_id_ex_output;
	logic [3:0] ALUop_id_ex_output;	
	logic regwrite_id_ex_output;
	logic [1:0] pcselect_id_ex_output;
	logic [1:0] regdst_id_ex_output;
	logic branch_id_ex_output;
	logic request_dmemREN_id_ex_output;
	logic request_dmemWEN_id_ex_output;
	logic halt_out_id_ex_output;
	logic [31:0] NPC_id_ex_output;
	logic [31:0] rdat_one_id_ex_output;
	logic [31:0] rdat_two_id_ex_output;
	logic [31:0] imemload_id_ex_output;
	logic [31:0] uppersixteen_id_ex_output;
	logic [31:0] signzerovalue_id_ex_output;
	//exmem signals
	logic [1:0]  	memtoreg_ex_mem_output;
	logic 	 	regwrite_ex_mem_output;
	logic [1:0]  	pcselect_ex_mem_output;
	logic 	 	branchSelect_ex_mem_output;
	logic 	 	dmemREN_ex_mem_output;
	logic 	 	dmemWEN_ex_mem_output;
	logic 	 	halt_out_ex_mem_output;
	logic [31:0] 	rdat1_ex_mem_output;
	logic [31:0] 	rdat2_ex_mem_output;
	logic [31:0] 	npc_ex_mem_output;
	logic 	 	zeroFlag_ex_mem_output;
	logic [31:0] 	aluResult_ex_mem_output;
	logic [4:0]  	branchDest_ex_mem_output;
	logic [31:0] 	upper16_ex_mem_output;
	logic [31:0] 	signZero_ex_mem_output;
	logic [25:0] 	iMemLoad_ex_mem_output;
	//memwb signals
	logic [1:0]  	memtoreg_mem_wb_output;
	logic 	 	regwrite_mem_wb_output;
	logic [1:0]  	pcselect_mem_wb_output;
	logic [31:0] 	npc_mem_wb_output;
	logic [31:0] 	aluResult_mem_wb_output;
	logic [4:0]  	branchDest_mem_wb_output;
	logic [31:0] 	upper16_mem_wb_output;
	logic [31:0] 	dMemLoad_mem_wb_output;
	
	//misc
	logic [31:0] uppersixteen;
	logic [4:0] branchDest_input;
	logic [31:0] branchPC;
	logic [31:0] jumpPC;
	logic halt_id_ex_input;

	// pc init
  parameter PC_INIT = 0;

	//instantiation of REGISTER
	register_file REGISTER(
				.CLK(CLK),
				.nRST(nRST),
				.registerval(registerval)
				);

	

	//setting IO
	assign read_data_one_output = registerval.rdat1;
	assign read_data_two_output = registerval.rdat2;
	assign registerval.rsel1 = imemload_if_id_output[25:21];
	assign registerval.rsel2 = imemload_if_id_output[20:16];
	assign registerval.WEN = regwrite_mem_wb_output;
	assign registerval.wsel = branchDest_mem_wb_output;
	assign registerval.wdat = writedata_output;
	assign dpif.imemREN = 1;
	assign dpif.dmemstore = rdat2_ex_mem_output;
	//assign dpif.halt = 0;

	//instantiation
	program_count PC(
			.ihit(dpif.ihit),
			.halt(halt_out_ex_mem_output),
			.CLK(CLK),
			.nRST(nRST),
			.next_pc_count(next_pc_count),
			.current_pc_count(current_pc_count)
			);
	
	//setting IO

	assign dpif.imemaddr = current_pc_count;


	//instantiation of CONTROL_UNIT
	control_unit CONTROLUNIT(
				.ALUsrc(ALUsrc),
				.memtoreg(memtoreg),
				.signzero(signzero),
				.ALUop(ALUop),
				.regwrite(regwrite),
				.pcselect(pcselect),
				.regdst(regdst),
				.branch(branch),
				.request_dmemREN(request_dmemREN),
				.request_dmemWEN(request_dmemWEN),
				.imemload(imemload_if_id_output),
				.halt_out(halt_id_ex_input)
				);

	//setting IO
	
	
	//instantiation of ALU
	alu ALU(
		.A(rdat_one_id_ex_output),
		.B(alu_input_two),
		.OPCODE(ALUop_id_ex_output),
		.OUTPUT(ALU_OUTPUT),
		.NEGATIVE(ALU_NEGATIVE),
		.OVERFLOW(ALU_OVERFLOW),
		.ZERO(ALU_ZERO)
		);

	//setting IO
	
	assign ALU_OPCODE = ALUop;					
	assign dpif.dmemaddr = aluResult_ex_mem_output;

	//instantiation of REQUEST BLOCK
	request_unit RB(
		.CLK(CLK),
		.dhit(dpif.dhit),
		.request_dmemREN(dmemREN_ex_mem_output),
		.request_dmemWEN(dmemWEN_ex_mem_output),
		.request_dmemREN_output(request_dmemREN_output),
		.request_dmemWEN_output(request_dmemWEN_output)
		); 

	//setting IO
	
	assign dpif.dmemWEN = request_dmemWEN_output;
	assign dpif.dmemREN = request_dmemREN_output;

	//assign dpif.dmemWEN = dmemWEN_ex_mem_output;
	//assign dpif.dmemREN = dmemREN_ex_mem_output;


	//instantiation of IF ID LATCH
	if_id_latch IFID(
			.CLK(CLK),
			.nRST(nRST),
			.NPC(next_pc_count),
			.imemload(dpif.imemload),
			.NPC_if_id_output(NPC_if_id_output),
			.imemload_if_id_output(imemload_if_id_output)
			);
	
	//instantiation of ID EX LATCH
	id_ex_latch IDEX(
			.CLK(CLK),
			.nRST(nRST),
			.ALUsrc(ALUsrc),
			.memtoreg(memtoreg),
			.ALUop(ALUop),	
			.regwrite(regwrite),
			.pcselect(pcselect),
			.regdst(regdst),
			.branch(branch),
			.request_dmemREN(request_dmemREN),
			.request_dmemWEN(request_dmemWEN),
			.halt_out(halt_id_ex_input),
			.NPC(NPC_if_id_output),
			.rdat_one(read_data_one_output),
			.rdat_two(read_data_two_output),
			.imemload(imemload_if_id_output),
			.uppersixteen(uppersixteen),
			.signzerovalue(signzero_output),
			.ALUsrc_id_ex_output(ALUsrc_id_ex_output),
			.memtoreg_id_ex_output(memtoreg_id_ex_output),
			.ALUop_id_ex_output(ALUop_id_ex_output),	
			.regwrite_id_ex_output(regwrite_id_ex_output),
			.pcselect_id_ex_output(pcselect_id_ex_output),
			.regdst_id_ex_output(regdst_id_ex_output),
			.branch_id_ex_output(branch_id_ex_output),
			.request_dmemREN_id_ex_output(request_dmemREN_id_ex_output),
			.request_dmemWEN_id_ex_output(request_dmemWEN_id_ex_output),
			.halt_out_id_ex_output(halt_out_id_ex_output),
			.NPC_id_ex_output(NPC_id_ex_output),
			.rdat_one_id_ex_output(rdat_one_id_ex_output),
			.rdat_two_id_ex_output(rdat_two_id_ex_output),
			.imemload_id_ex_output(imemload_id_ex_output),
			.uppersixteen_id_ex_output(uppersixteen_id_ex_output),
			.signzerovalue_id_ex_output(signzerovalue_id_ex_output)
			);		

	//instantiation of EX MEM
	ex_mem_latch EXMEM(
			.CLK(CLK),
			.nRST(nRST),
			.memtoreg_in(memtoreg_id_ex_output),
			.regwrite_in(regwrite_id_ex_output),
			.pcselect_in(pcselect_id_ex_output),
			.branchSelect_in(branch_id_ex_output),
			.dmemREN_in(request_dmemREN_id_ex_output),
			.dmemWEN_in(request_dmemWEN_id_ex_output),
			.halt_in(halt_out_id_ex_output),
			.rdat1_in(rdat_one_id_ex_output),
			.rdat2_in(rdat_two_id_ex_output),
			.npc_in(NPC_id_ex_output),
			.zeroFlag_in(ALU_ZERO),
			.aluResult_in(ALU_OUTPUT),
			.branchDest_in(branchDest_input),
			.upper16_in(uppersixteen_id_ex_output),
			.signZero_in(signzerovalue_id_ex_output),
			.iMemLoad_in(imemload_id_ex_output[25:0]),
			.memtoreg(memtoreg_ex_mem_output),
			.regwrite(regwrite_ex_mem_output),
			.pcselect(pcselect_ex_mem_output),
			.branchSelect(branchSelect_ex_mem_output),
			.dmemREN(dmemREN_ex_mem_output),
			.dmemWEN(dmemWEN_ex_mem_output),
			.halt_out(halt_out_ex_mem_output),
			.rdat1(rdat1_ex_mem_output),
			.rdat2(rdat2_ex_mem_output),
			.npc(npc_ex_mem_output),
			.zeroFlag(zeroFlag_ex_mem_output),
			.aluResult(aluResult_ex_mem_output),
			.branchDest(branchDest_ex_mem_output),
			.upper16(upper16_ex_mem_output),
			.signZero(signZero_ex_mem_output),
			.iMemLoad(iMemLoad_ex_mem_output)
			);

	//assign dpif.halt = halt_out_ex_mem_output;
        assign dpif.halt = 0;
	//instantiation of MEM WB
	mem_wb_latch MEMWB(
			.CLK(CLK),
			.nRST(nRST),
			.memtoreg_in(memtoreg_ex_mem_output),
			.regwrite_in(regwrite_ex_mem_output),
			.pcselect_in(pcselect_ex_mem_output),
			.npc_in(npc_ex_mem_output),
			.aluResult_in(aluResult_ex_mem_output),
			.branchDest_in(branchDest_ex_mem_output),
			.upper16_in(upper16_ex_mem_output),
			.dMemLoad_in(dpif.dmemload),
			.memtoreg(memtoreg_mem_wb_output),
			.regwrite(regwrite_mem_wb_output),
			.pcselect(pcselect_mem_wb_output),
			.npc(npc_mem_wb_output),
			.aluResult(aluResult_mem_wb_output),
			.branchDest(branchDest_mem_wb_output),
			.upper16(upper16_mem_wb_output),
			.dMemLoad(dMemLoad_mem_wb_output)
			);

	//instantiate branch mux
	branch_mux BRANCHMUX(
			.nextPC(pc_count_four_output),
			.branchPC(branch_count_output),
			.branchSelect(branch_xnor_output),
			.out(branch_mux_output)
			);


	//instantiate NPC mux
	npc_mux NPCMUX(
			.pcPlus4(pc_count_four_output),
			.jumpRegPC(rdat1_ex_mem_output),
			.branchPC(branch_mux_output),
			.jumpPC(jumpPC),
			.nextPCSelect(pcselect_ex_mem_output),
			.out(next_pc_count)
			);

	//instantiate extender mux
	extender EXTENDER(
			.immediate(imemload_if_id_output[15:0]),
			.extend_code(signzero),
			.extended_imm(signzero_output)
			);

	//instantiate alu source mux
	alu_source_mux ALUSRCMUX(
			.readReg2(read_data_two_output),
			.extendedImmediate(signzerovalue_id_ex_output),
			.shiftAmount(imemload_id_ex_output[10:6]),
			.aluSource(ALUsrc_id_ex_output),
			.out(alu_input_two)
			);

	//instantiate reg dest mux
	reg_dest_mux REGDESTMUX(
			.rt(imemload_id_ex_output[20:16]),
			.rd(imemload_id_ex_output[15:11]),
			.regDest(regdst_id_ex_output),
			.out(branchDest_input)
			);
	
	//instantiate mem to mex
	mem_to_reg_mux MEMTOREG(
			.aluOut(aluResult_mem_wb_output),
			.dload(dMemLoad_mem_wb_output),
			.shiftedImmediate(upper16_mem_wb_output),
			.npc(npc_mem_wb_output),
			.memToReg(memtoreg_mem_wb_output),
			.out(writedata_output)
			);	
	
		assign pc_count_four_output = current_pc_count + 4;
		assign branch_count_output = (signZero_ex_mem_output << 2) + npc_ex_mem_output;
		assign branch_xnor_output = ~(branchSelect_ex_mem_output ^ zeroFlag_ex_mem_output);
		assign jumpPC = {pc_count_four_output[31:28], (iMemLoad_ex_mem_output << 2)};
		assign uppersixteen = imemload_id_ex_output[15:0] << 16;
	
	
	
	

endmodule
