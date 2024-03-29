
// data path interface
`include "datapath_cache_if.vh"

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module datapath_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;
  // interface
  datapath_cache_if dpif ();
  // test program
  test PROG ();
  // DUT


`ifndef MAPPED
  datapath DUT(
	CLK,
	nRST,
	dpif);
`else
  datapath DUT(
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
    .\nRST (nRST),
    .\CLK (CLK)
  );
`endif

initial begin
	nRST = 0;
	#10
	nRST = 1;
	//                  |op  |  rs| rt | 
	dpif.imemload = 32'b00100100000000010000000000000001;
	//stored the value 1 to register 1
	#10
	//                  |op  |  rs| rt | 
	dpif.imemload = 32'b00100100000000100000000000000010;
	//stored the value 2 to register 2
	#10
	//                  |op  |  rs| rt | 
	dpif.imemload = 32'b00100100000000110000000000000011;
	//stored the value 3 to register 3
	#10
	//                  |op  |  rs| rt | 
	dpif.imemload = 32'b00100100000001000000000000000100;
	//stored the value 4 to register 4
	#10
	//                  |op  |  rs| rt | 
	dpif.imemload = 32'b00100100000001010000000000000101;
	//stored the value 5 to register 5
	#10
	//                  |op  |  rs| rt | 
	dpif.imemload = 32'b00100100000001100000000000000110;
	//stored the value 6 to register 6
	#10
	//                  |op  |  rs| rt | 
	dpif.imemload = 32'b00100100000001110000000000000111;
	//stored the value 7 to register 7
	#10
	//                  |op  |  rs| rt | 
	dpif.imemload = 32'b00100100000010000000000000001000;
	//stored the value 8 to register 8
	#10
	//time to add register 1 and 2 and store it in register 9, the answer should be 3
	//                  |op  |  rs| rt |  rd|
	//dpif.imemload = 32'b00000000000010000000000000100001;
	//                   op         rs     rt         rd               function
	dpif.imemload = {6'b000000,5'b00001,5'b00010,5'b01001,5'b00000,6'b100001};


	end

endmodule


program test;
endprogram
