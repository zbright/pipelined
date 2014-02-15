
// mapped needs this
`include "cache_control_if.vh"
// memory types
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module memory_control_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // test vars
  int v1 = 1;
  int v2 = 4721;
  int v3 = 25119;
  int k;
  

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  cache_control_if ccif ();

  
  // test program
  test PROG ();
  // DUT
`ifndef MAPPED
  memory_control DUT(CLK, nRST, ccif);
`else
  memory_control DUT(
    .\ccif.iREN (ccif.iREN),
    .\ccif.dREN (ccif.dREN),
    .\ccif.dWEN (ccif.dWEN),
    .\ccif.dstore (ccif.dstore),
    .\ccif.iaddr (ccif.iaddr),
    .\ccif.daddr (ccif.daddr),
    .\ccif.ramload (ccif.ramload),
    .\ccif.ramstate (ccif.ramstate),
    .\ccif.ccwrite (ccif.ccwrite),
    .\ccif.cctrans (ccif.cctrans),
    .\ccif.iwait (ccif.iwait),
    .\ccif.dwait (ccif.dwait),
    .\ccif.iload (ccif.iload),
    .\ccif.dload (ccif.dload),
    .\ccif.ramstore (ccif.ramstore),
    .\ccif.ramaddr (ccif.ramaddr),
    .\ccif.ramWEN (ccif.ramWEN),
    .\ccif.ramREN (ccif.ramREN),
    .\ccif.ccwait (ccif.ccwait),
    .\ccif.ccinv (ccif.ccinv),
    .\ccif.ccsnoopaddr (ccif.ccsnoopaddr),
    .\nRST (nRST),
    .\CLK (CLK)
  );
`endif

initial begin
	$display("\tdREN,\tdWEN,\tiREN,\tramload,\tiaddr,\tdaddr,\ttime");
	$monitor("%b,\t%b,\t%b\,\t%h,\t%d,\t%d,\%d", ccif.dREN,ccif.dWEN,ccif.iREN,ccif.ramload,ccif.iaddr,ccif.daddr,$time);
	end
  import cpu_types_pkg::*;
 
initial begin
	
	//default the nRST
	nRST = 1;
	ccif.ramload = 32'h111111;
	#30
	nRST = 0;
	#10
	//toggle nRST
	nRST = 1;
	#10
	//test to see if the value is being read, in this case it shouldn't because the ramload is still BAD
	ccif.dREN = 1;
	ccif.daddr = 84;
	#30
	//should correctly read the data
	ccif.ramload = 32'h98392742;
	ccif.ramstate = ACCESS;
	#30
	//makes the ramload BAD value again
	ccif.ramstate = BUSY;
	ccif.ramload = 32'h11111111;
	ccif.iREN = 1;
	ccif.dREN = 0;
	ccif.iaddr = 84;
	#30
	//the instruction is now read as 11111111
	ccif.ramload = 32'h11111111;
	#30
	//the data should be written not the 
	ccif.iREN = 1;
	ccif.dWEN = 1;
	
 	end

endmodule



program test;
endprogram
