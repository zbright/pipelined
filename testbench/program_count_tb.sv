// mapped timing needs this. 1ns is too fast
// data path interface
//`include "datapath_cache_if.vh"

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

`timescale 1 ns / 1 ns

module program_count_tb;

  parameter PERIOD = 10;


  logic [31:0] next_pc_count;
  logic [31:0] current_pc_count;
  logic CLK = 0, nRST;
  // clock
  always #(PERIOD/2) CLK++;

  // interface
  //datapath_cache_if dpif ();

  // test program
  test PROG ();

`ifndef MAPPED
  program_count DUT(CLK, nRST, next_pc_count, current_pc_count);
`else
  program_count DUT(
 /*   .\dpif.ihit (dpif.ihit),
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
    .\dpif.dmemaddr (dpif.dmemaddr),*/
    .\next_pc_count (next_pc_count),
    .\current_pc_count (current_pc_count),
    .\nRST (nRST),
    .\CLK (CLK)
  );
`endif

 initial begin

	nRST = 1;
	#20
	nRST = 0;
	#10
	nRST = 1;
	next_pc_count = 99;
	#10
	next_pc_count = 23;
	//this doesn't work. didn't assign dpif to anything and synthesis is complaining
	//dpif.imemREN = 1;

 end


endmodule


program test;
endprogram
