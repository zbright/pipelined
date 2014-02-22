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

	// pc init
	parameter PC_INIT = 0;

	// interface
	register_file_if                            registerval ();

	//signals for register file
	logic [31:0] 	read_data_one_output;
	logic [31:0] 	read_data_two_output;
	//signals for PC
	logic [31:0] 	next_pc_count;
	logic [31:0] 	current_pc_count;
	//signals for control unit
	logic [1:0] 	alusource;
	logic [1:0] 	memtoreg;
	logic 			shift;
	logic 			signzero;
	logic [3:0] 	aluop;
	logic 			jal;
	logic 			regwrite;
	logic [1:0] 	pcselect;
	logic [1:0] 	regdst;
	logic 			branch;
	logic 			dmemren;
	logic 			dmemwen;
	//signals for ALU
	logic [31:0]	alu_input_two;
	logic [3:0] 	alu_opcode;
	logic [31:0] 	alu_output;
	logic 			alu_negative;
	logic 			alu_overflow;
	logic 			alu_zero;
	//signal for signzero
	logic [31:0] 	signzero_output;
	//signal for memtoreg mux
	logic [31:0] 	writedata_output;
	//pccount + 4 output
	logic [31:0] 	pc_count_four_output;
	//branch address calculate
	logic [31:0] 	branch_count_output;
	//branch xnor output
	logic 			branch_xnor_output;
	//branch mux
	logic [31:0] 	branch_mux_output;
	//ifid
	logic [31:0] 	npc_if_id_output;
	logic [31:0] 	imemload_if_id_output;
	//idex signals
	logic [1:0] 	alusource_id_ex_output;
	logic [1:0] 	memtoreg_id_ex_output;
	logic 			signzero_id_ex_output;
	logic [3:0] 	aluop_id_ex_output;
	logic 			regwrite_id_ex_output;
	logic [1:0] 	pcselect_id_ex_output;
	logic [1:0] 	regdst_id_ex_output;
	logic 			branch_id_ex_output;
	logic 			dmemren_id_ex_output;
	logic 			dmemwen_id_ex_output;
	logic 			halt_out_id_ex_output;
	logic [31:0] 	npc_id_ex_output;
	logic [31:0] 	rdat_one_id_ex_output;
	logic [31:0] 	rdat_two_id_ex_output;
	logic [31:0] 	imemload_id_ex_output;
	logic [31:0] 	uppersixteen_id_ex_output;
	logic [31:0] 	signzerovalue_id_ex_output;
	//exmem signals
	logic [1:0]  	memtoreg_ex_mem_output;
	logic 	 		regwrite_ex_mem_output;
	logic [1:0]  	pcselect_ex_mem_output;
	logic 	 		branchselect_ex_mem_output;
	logic 	 		dmemren_ex_mem_output;
	logic 	 		dmemwen_ex_mem_output;
	logic 	 		halt_out_ex_mem_output;
	logic [31:0] 	rdat1_ex_mem_output;
	logic [31:0] 	rdat2_ex_mem_output;
	logic [31:0] 	npc_ex_mem_output;
	logic 	 		zeroflag_ex_mem_output;
	logic [31:0] 	aluresult_ex_mem_output;
	logic [4:0]  	branchdest_ex_mem_output;
	logic [31:0] 	upper16_ex_mem_output;
	logic [31:0] 	signzero_ex_mem_output;
	logic [31:0] 	imemload_ex_mem_output;
	//memwb signals
	logic [1:0]  	memtoreg_mem_wb_output;
	logic 	 		regwrite_mem_wb_output;
	logic [1:0]  	pcselect_mem_wb_output;
	logic [31:0] 	npc_mem_wb_output;
	logic [31:0] 	aluresult_mem_wb_output;
	logic [4:0]  	branchdest_mem_wb_output;
	logic [31:0] 	upper16_mem_wb_output;
	logic [31:0] 	dmemload_mem_wb_output;
	logic [31:0]	imemload_mem_wb_output;

	//misc
	logic [31:0] 	uppersixteen;
	logic [4:0] 	branchdest_input;
	logic [31:0] 	jump_pc;
	logic 			halt_id_ex_input;

	//Hazard Unit signals
	logic 			pc_stall;
	logic			if_id_stall;
	logic 			id_ex_stall;
	logic			if_id_bubble;
	logic 			id_ex_bubble;
	logic			if_id_flush;
	logic 			id_ex_flush;
	logic 			ex_mem_flush;

	//forward unit signals
	logic [2:0] 	forwarda;
	logic [2:0] 	forwardb;
	logic [31:0]	alu_a_mux_output;
	logic [31:0]	alu_b_mux_output;



	//assign statements

	assign pc_count_four_output = current_pc_count + 4;
	assign branch_count_output = (signzero_ex_mem_output << 2) + npc_ex_mem_output;
	assign branch_xnor_output = ~(branchselect_ex_mem_output ^ zeroflag_ex_mem_output);
	assign jump_pc = {pc_count_four_output[31:28], (imemload_ex_mem_output[25:0] << 2)};
	assign uppersixteen = imemload_if_id_output[15:0] << 16;
	assign read_data_one_output = registerval.rdat1;
	assign read_data_two_output = registerval.rdat2;
	assign registerval.rsel1 = imemload_if_id_output[25:21];
	assign registerval.rsel2 = imemload_if_id_output[20:16];
	assign registerval.WEN = regwrite_mem_wb_output;
	assign registerval.wsel = branchdest_mem_wb_output;
	assign registerval.wdat = writedata_output;
	assign dpif.imemREN = 1;
	assign dpif.dmemstore = rdat2_ex_mem_output;
	assign alu_opcode = aluop;
	assign dpif.dmemaddr = aluresult_ex_mem_output;
	assign dpif.dmemWEN = dmemwen_ex_mem_output;
	assign dpif.dmemREN = dmemren_ex_mem_output;
	assign dpif.halt = halt_out_ex_mem_output;
	assign dpif.imemaddr = current_pc_count;


	//instantiation of REGISTER
	register_file REGISTER(
		.CLK(CLK),
		.nRST(nRST),
		.registerval(registerval)
		);

	//instantiation
	program_count PC(
		.CLK(CLK),
		.nRST(nRST),
		.next_pc_count(next_pc_count),
		.stall(pc_stall),
		.current_pc_count(current_pc_count)
		);

	//instantiation of CONTROL_UNIT
	control_unit CONTROLUNIT(
		.ALUsrc(alusource),
		.memtoreg(memtoreg),
		.signzero(signzero),
		.ALUop(aluop),
		.regwrite(regwrite),
		.pcselect(pcselect),
		.regdst(regdst),
		.branch(branch),
		.request_dmemREN(dmemren),
		.request_dmemWEN(dmemwen),
		.imemload(imemload_if_id_output),
		.halt_out(halt_id_ex_input)
		);

	//instantiation of ALU
	alu ALU(
		.A(alu_a_mux_output),
		.B(alu_input_two),
		.OPCODE(aluop_id_ex_output),
		.OUTPUT(alu_output),
		.NEGATIVE(alu_negative),
		.OVERFLOW(alu_overflow),
		.ZERO(alu_zero)
		);

	//instantiation of hazard unit

	hazard_unit HAZARDUNIT(
		.dmemREN(dmemren_ex_mem_output),
		.dmemWEN(dmemwen_ex_mem_output),
		.dhit(dpif.dhit),
		.ihit(dpif.ihit),
		.halt(halt_out_ex_mem_output),
		.branch_flag(branch_id_ex_output),
		.zero_flag(alu_zero),
		.imemload(imemload_ex_mem_output),
		.id_ex_dmemren(dmemren_id_ex_output),
		.id_ex_rt(imemload_id_ex_output[20:16]),
		.if_id_rs(imemload_if_id_output[25:21]),
		.if_id_rt(imemload_if_id_output[20:16]),
		.pc_stall(pc_stall),
		.if_id_stall(if_id_stall),
		.if_id_bubble(if_id_bubble),
		.if_id_flush(if_id_flush),
		.id_ex_stall(id_ex_stall),
		.id_ex_flush(id_ex_flush),
		.id_ex_bubble(id_ex_bubble),
		.ex_mem_flush(ex_mem_flush)
		);

	//instantiation of forwarding unit

	forward FORWADUNIT(
		.branchdest_input(branchdest_input),
		.branchdest_ex_mem_output(branchdest_ex_mem_output),
		.branchdest_mem_wb_output(branchdest_mem_wb_output),
		.imemload_id_ex_output(imemload_id_ex_output),
		.regwrite_ex_mem_output(regwrite_ex_mem_output),
		.regwrite_mem_wb_output(regwrite_mem_wb_output),
		.memtoreg_ex_mem_output(memtoreg_ex_mem_output),
		.memtoreg_mem_wb_output(memtoreg_mem_wb_output),
		.forwarda(forwarda),
		.forwardb(forwardb)
		);


///////////////PIPELINE REGISTERS//////////////////////////////

	//instantiation of IF ID LATCH
	if_id_latch IFID(
		.CLK(CLK),
		.nRST(nRST),
		.NPC(next_pc_count),
		.imemload(dpif.imemload),
		.bubble(if_id_bubble),
		.stall(if_id_stall),
		.flush(if_id_flush),
		.npc_if_id_output(npc_if_id_output),
		.imemload_if_id_output(imemload_if_id_output)
		);

	//instantiation of ID EX LATCH
	id_ex_latch IDEX(
		.CLK(CLK),
		.nRST(nRST),
		.ALUsrc(alusource),
		.memtoreg(memtoreg),
		.ALUop(aluop),
		.regwrite(regwrite),
		.pcselect(pcselect),
		.regdst(regdst),
		.branch(branch),
		.request_dmemREN(dmemren),
		.request_dmemWEN(dmemwen),
		.halt_out(halt_id_ex_input),
		.NPC(npc_if_id_output),
		.rdat_one(read_data_one_output),
		.rdat_two(read_data_two_output),
		.imemload(imemload_if_id_output),
		.uppersixteen(uppersixteen),
		.signzerovalue(signzero_output),
		.stall(id_ex_stall),
		.flush(id_ex_flush),
		.dhit(dpif.dhit),
		.bubble(id_ex_bubble),
		.ALUsrc_id_ex_output(alusource_id_ex_output),
		.memtoreg_id_ex_output(memtoreg_id_ex_output),
		.ALUop_id_ex_output(aluop_id_ex_output),
		.regwrite_id_ex_output(regwrite_id_ex_output),
		.pcselect_id_ex_output(pcselect_id_ex_output),
		.regdst_id_ex_output(regdst_id_ex_output),
		.branch_id_ex_output(branch_id_ex_output),
		.request_dmemREN_id_ex_output(dmemren_id_ex_output),
		.request_dmemWEN_id_ex_output(dmemwen_id_ex_output),
		.halt_out_id_ex_output(halt_out_id_ex_output),
		.NPC_id_ex_output(npc_id_ex_output),
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
		.dmemREN_in(dmemren_id_ex_output),
		.dmemWEN_in(dmemwen_id_ex_output),
		.halt_in(halt_out_id_ex_output),
		.rdat1_in(alu_a_mux_output),
		.rdat2_in(alu_b_mux_output),
		.npc_in(npc_id_ex_output),
		.zeroFlag_in(alu_zero),
		.aluResult_in(alu_output),
		.branchDest_in(branchdest_input),
		.upper16_in(uppersixteen_id_ex_output),
		.signZero_in(signzerovalue_id_ex_output),
		.iMemLoad_in(imemload_id_ex_output),
		.dhit(dpif.dhit),
		.flush(ex_mem_flush),
		.memtoreg(memtoreg_ex_mem_output),
		.regwrite(regwrite_ex_mem_output),
		.pcselect(pcselect_ex_mem_output),
		.branchSelect(branchselect_ex_mem_output),
		.dmemREN(dmemren_ex_mem_output),
		.dmemWEN(dmemwen_ex_mem_output),
		.halt_out(halt_out_ex_mem_output),
		.rdat1(rdat1_ex_mem_output),
		.rdat2(rdat2_ex_mem_output),
		.npc(npc_ex_mem_output),
		.zeroFlag(zeroflag_ex_mem_output),
		.aluResult(aluresult_ex_mem_output),
		.branchDest(branchdest_ex_mem_output),
		.upper16(upper16_ex_mem_output),
		.signZero(signzero_ex_mem_output),
		.iMemLoad(imemload_ex_mem_output)
		);

	//instantiation of MEM WB
	mem_wb_latch MEMWB(
		.CLK(CLK),
		.nRST(nRST),
		.memtoreg_in(memtoreg_ex_mem_output),
		.regwrite_in(regwrite_ex_mem_output),
		.pcselect_in(pcselect_ex_mem_output),
		.npc_in(npc_ex_mem_output),
		.aluResult_in(aluresult_ex_mem_output),
		.branchDest_in(branchdest_ex_mem_output),
		.upper16_in(upper16_ex_mem_output),
		.dMemLoad_in(dpif.dmemload),
		.imemload_in(imemload_ex_mem_output),
		.memtoreg(memtoreg_mem_wb_output),
		.regwrite(regwrite_mem_wb_output),
		.pcselect(pcselect_mem_wb_output),
		.npc(npc_mem_wb_output),
		.aluResult(aluresult_mem_wb_output),
		.branchDest(branchdest_mem_wb_output),
		.upper16(upper16_mem_wb_output),
		.dMemLoad(dmemload_mem_wb_output),
		.imemload(imemload_mem_wb_output)
		);


/////////////////MUXES///////////////////////////////////////

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
		.jumpPC(jump_pc),
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
	alu_source_mux alusourceMUX(
		.readReg2(alu_b_mux_output),
		.extendedImmediate(signzerovalue_id_ex_output),
		.shiftAmount(imemload_id_ex_output[10:6]),
		.aluSource(alusource_id_ex_output),
		.out(alu_input_two)
		);

	//instantiate reg dest mux
	reg_dest_mux REGDESTMUX(
		.rt(imemload_id_ex_output[20:16]),
		.rd(imemload_id_ex_output[15:11]),
		.regDest(regdst_id_ex_output),
		.out(branchdest_input)
		);

	//instantiate mem to mex
	mem_to_reg_mux MEMTOREG(
		.aluOut(aluresult_mem_wb_output),
		.dload(dmemload_mem_wb_output),
		.shiftedImmediate(upper16_mem_wb_output),
		.npc(npc_mem_wb_output),
		.memToReg(memtoreg_mem_wb_output),
		.out(writedata_output)
		);

	//instantiation of alu_a_mux
	alu_a_mux ALUAMUX(
		.forwarda(forwarda),
		.rdat_one_id_ex_output(rdat_one_id_ex_output),
		.aluresult_ex_mem_output(aluresult_ex_mem_output),
		.aluresult_mem_wb_output(aluresult_mem_wb_output),
		.upper16_ex_mem_output(upper16_ex_mem_output),
		.upper16_mem_wb_output(upper16_mem_wb_output),
		.alu_a_mux_output(alu_a_mux_output)
		);

	//instantiate alu_b_mux
	alu_b_mux ALUBMUX(
		.forwardb(forwardb),
		.rdat_two_id_ex_output(rdat_two_id_ex_output),
		.aluresult_ex_mem_output(aluresult_ex_mem_output),
		.aluresult_mem_wb_output(aluresult_mem_wb_output),
		.upper16_ex_mem_output(upper16_ex_mem_output),
		.upper16_mem_wb_output(upper16_mem_wb_output),
		.alu_b_mux_output(alu_b_mux_output)
		);


endmodule
