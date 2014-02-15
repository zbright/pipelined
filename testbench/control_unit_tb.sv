// data path interface
`include "datapath_cache_if.vh"

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module control_unit_tb;

  parameter PERIOD = 10;

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

  // interface
  datapath_cache_if dpif ();
  // test program
  test PROG ();
  // DUT
`ifndef MAPPED
  control_unit DUT(ALUsrc,
	memtoreg,
	shift,
	signzero,
	ALUop,	
	JAL,
	regwrite,
	pcselect,
	regdst,
	branch,
	request_dmemREN,
	request_dmemWEN,
	dpif);
`else
  control_unit DUT(
    .\dpif.ihit (dpif.ihit),
    .\dpif.imemload (dpif.imemload),
    .\dpif.dhit (dpif.dhit),
    .\dpif.dmemload (dpif.dmemload),
    .\dpif.halt (dpif.halt),
    .\dpif.imemREN (dpif.imemREN),
    .\dpif.imemaddr (dpif.imemaddr),
    .\dpif.dmemREN (dpif.dmemREN),
    .\dpif.dmemWEN (dpif.dmemWEN),
    .\dpif.datomic (dpif.datomic),
    .\dpif.dmemstore (dpif.dmemstore),
    .\dpif.dmemaddr (dpif.dmemaddr),
    .\ALUsrc (ALUsrc),
    .\memtoreg (memtoreg),
    .\shift (shift),
    .\signzero (signzero),
    .\ALUop (ALUop),
    .\JAL (JAL),
    .\regwrite (regwrite),
    .\pcselect (pcselect),
    .\regdst (regdst),	
    .\branch (branch),
    .\request_dmemREN (request_dmemREN),
    .\request_dmemWEN (request_dmemWEN)
  );
`endif

initial
begin

#10
//ADDU
dpif.imemload = 32'b00000011111000000000000000100001;
#10
//AND
dpif.imemload = 32'b00000011111000000000000000100100;
#10
//JR
dpif.imemload = 32'b00000011111000000000000000001000;
#10
//NOR
dpif.imemload = 32'b00000011111000000000000000100111;
#10
//OR
dpif.imemload = 32'b00000011111000000000000000100101;
#10
//SLT
dpif.imemload = 32'b00000011111000000000000000101010;
#10
//SLTU
dpif.imemload = 32'b00000011111000000000000000101011;
#10
//SUBU
dpif.imemload = 32'b00000011111000000000000000100011;
#10
//XOR
dpif.imemload = 32'b00000011111000000000000000100110;
#10
//ADDIU
dpif.imemload = 32'b00100111111111111111111111111111;
#10
//ANDI
dpif.imemload = 32'b00100011111111111111111111111111;
#10
//BEQ
dpif.imemload = 32'b00010011111111111111111111111111;
#10
//BNE
dpif.imemload = 32'b00010111111111111111111111111111;
#10
//LUI
dpif.imemload = 32'b00111111111111111111111111111111;
#10
//LW
dpif.imemload = 32'b10001111111111111111111111111111;
#10
//ORI
dpif.imemload = 32'b00110111111111111111111111111111;
#10
//SLTI
dpif.imemload = 32'b00101011111111111111111111111111;
#10
//SLTIU
dpif.imemload = 32'b00101111111111111111111111111111;
#10
//SW
dpif.imemload = 32'b10101111111111111111111111111111;
#10
//XORI
dpif.imemload = 32'b00111011111111111111111111111111;
#10
//J
dpif.imemload = 32'b00001011111111111111111111111111;
#10
//JAL
dpif.imemload = 32'b00001111111111111111111111111111;



end


endmodule



program test;
endprogram
