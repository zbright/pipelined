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
	logic [2:0] pcselect;
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
	assign registerval.rsel1 = dpif.imemload[25:21];
	assign registerval.rsel2 = dpif.imemload[20:16];
	assign registerval.WEN = regwrite;
	assign dpif.imemREN = 1;
	assign dpif.dmemstore = registerval.rdat2;
	//assign dpif.halt = 0;

	//instantiation
	program_count PC(
			.ihit(dpif.ihit),
			.halt(dpif.halt),
			.CLK(CLK),
			.nRST(nRST),
			.next_pc_count(next_pc_count),
			.current_pc_count(current_pc_count)
			);
	
	//setting IO

	assign dpif.imemaddr = current_pc_count;


	//instantiation of CONTROL_UNIT
	control_unit REQUEST(
				.ALUsrc(ALUsrc),
				.memtoreg(memtoreg),
				.shift(shift),
				.signzero(signzero),
				.ALUop(ALUop),
				.JAL(JAL),
				.regwrite(regwrite),
				.pcselect(pcselect),
				.regdst(regdst),
				.branch(branch),
				.request_dmemREN(request_dmemREN),
				.request_dmemWEN(request_dmemWEN),
				.imemload(dpif.imemload),
				.halt_out(dpif.halt)
				);

	//setting IO
	
	
	//instantiation of ALU
	alu ALU(
		.A(alu_input_one),
		.B(alu_input_two),
		.OPCODE(ALU_OPCODE),
		.OUTPUT(ALU_OUTPUT),
		.NEGATIVE(ALU_NEGATIVE),
		.OVERFLOW(ALU_OVERFLOW),
		.ZERO(ALU_ZERO)
		);

	//setting IO
	
	assign ALU_OPCODE = ALUop;					
	assign dpif.dmemaddr = ALU_OUTPUT;

	//instantiation of REQUEST BLOCK
	request_unit RB(
		.CLK(CLK),
		.dhit(dpif.dhit),
		.request_dmemREN(request_dmemREN),
		.request_dmemWEN(request_dmemWEN),
		.request_dmemREN_output(request_dmemREN_output),
		.request_dmemWEN_output(request_dmemWEN_output)
		);

	//setting IO
	
	assign dpif.dmemWEN = request_dmemWEN_output;
	assign dpif.dmemREN = request_dmemREN_output;
	

	//MUX
	always_comb
	begin: SHIFT
		if (shift == 0) begin
			alu_input_one = read_data_one_output;
		end else begin
			alu_input_one = read_data_two_output;
		end
	end

	//MUX
	always_comb
	begin: SIGNZERO
		if ((signzero == 0) || (dpif.imemload[15] == 0)) begin
			signzero_output = {{16{1'b0}}, dpif.imemload[15:0]};
		end else begin
			signzero_output = {{16{1'b1}}, dpif.imemload[15:0]};
		end
	end
				
	
	//MUX
	always_comb
	begin: ALUSRC
		if (ALUsrc == 0) begin
			alu_input_two = read_data_two_output;
		end else if (ALUsrc == 1) begin
			alu_input_two = signzero_output;
		end else if (ALUsrc == 2) begin
			alu_input_two = {{27{1'b0}},dpif.imemload[10:6]};		
		end else begin
			alu_input_two = 0;
		end
	end

	//MUX
	always_comb
	begin: MEMTOREG
		if (memtoreg == 0) begin
			writedata_output = ALU_OUTPUT;
		end else if (memtoreg == 1) begin
			writedata_output = dpif.dmemload;
		end else if (memtoreg == 2) begin
			writedata_output = {dpif.imemload[15:0], 16'b0};		
		end else begin
			writedata_output = 0;
		end
	end
				

	//MUX
	always_comb
	begin: REGDST
		if (regdst == 0) begin
			registerval.wsel = dpif.imemload[20:16];
		end else if (regdst == 1) begin
			registerval.wsel = dpif.imemload[15:11];
		end else if (regdst == 2) begin
			registerval.wsel = 31;		
		end else begin
			registerval.wsel = 0;
		end
	end

	//MUX
	always_comb
	begin: JUMPANDLINK
		if (JAL == 0) begin
			registerval.wdat = writedata_output;
		end else if (JAL == 1) begin
			registerval.wdat = pc_count_four_output;	
		end else begin
			registerval.wdat = 0;
		end
	end

	//should this be sequential or combinational
	//MUX
	//always_ff @(posedge CLK, negedge nRST)
	//begin: PCADDBLOCK
	//begin
		assign pc_count_four_output = current_pc_count + 4;
	//end

	
	//MUX
	always_comb
	begin: BRANCHADD
		branch_count_output = (signzero_output << 2) + pc_count_four_output;
	end

	//BRANCH XNOR
	always_comb
	begin: BRANCHXNOR
		branch_xnor_output = ~(branch ^ ALU_ZERO);
	end
	
	//BRANCH MUX
	always_comb
	begin: BRANCHMUX
		if (branch_xnor_output == 0) begin
			branch_mux_output = pc_count_four_output;
		end else if (branch_xnor_output == 1) begin
			branch_mux_output = branch_count_output;	
		end else begin
			branch_mux_output = 0;
		end
	end

	//MUX
	always_comb
	begin: NEXTPCSELECT
		if (pcselect == 0) begin
			next_pc_count = pc_count_four_output;
			//next_pc_count = branch_mux_output;
		end else if (pcselect == 1) begin
			next_pc_count = registerval.rdat1;
		end else if (pcselect == 2) begin
			//next_pc_count = 99;
			//next_pc_count = pc_count_four_output;
			next_pc_count = branch_mux_output;
		end else if (pcselect == 3) begin
			//double check to see if this a valid operation
			next_pc_count = {pc_count_four_output[31:28], (dpif.imemload[25:0] << 2)};	
		end else begin
			next_pc_count = 0;
		end
	end

	

endmodule
