`include "cache_control_if.vh"
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module memory_control_tb;
  // clock period
  parameter PERIOD = 20;

  // signals
  logic CLK = 1, nRST;

  // clock
  always #(PERIOD/2) CLK++;

   cache_control_if ccif();

   test PROG(CLK, nRST);

`ifndef MAPPED
   memory_control DUT(CLK,nRST,ccif);

`else
   memory_control DUT(
	   CLK,
	   nRST,
	   ccif.ccsnoopaddr,
	   ccif.ccinv,
	   ccif.ccwait,
	   ccif.ramREN,
	   ccif.ramWEN,
	   ccif.ramaddr,
	   ccif.ramstore,
	   ccif.dload,
	   ccif.iload,
	   ccif.dwait,
	   ccif.iwait,
	   ccif.cctrans,
	   ccif.ccwrite,
	   ccif.ramstate,
	   ccif.ramload,
	   ccif.daddr,
	   ccif.iaddr,
	   ccif.dstore,
	   ccif.dWEN,
	   ccif.dREN,
	   ccif.iREN
	   );
`endif
endmodule // memory_control_tb

program test(input logic CLK, output logic nRST);
   import cpu_types_pkg::*;

   parameter PERIOD = 20;

   initial
     begin
	nRST = 0;
	ccif.iREN = 0;
	ccif.dREN = 0;
	ccif.dWEN = 0;
	ccif.dstore = 0;

	ccif.ramstate = FREE;
	
	ccif.ramload = 32'hFFFFFFFF;
	ccif.daddr = 32'hAAAAAAAA;
	ccif.iaddr = 32'hBBBBBBBB;
	
	@(posedge CLK);
	$display("Beginning Tests");
	nRST = 1;

	ccif.dREN = 1;
		
	#(PERIOD)
	#(PERIOD)

        assert(ccif.ramREN == 1);
        assert(ccif.dload == ccif.ramload);
	assert(ccif.ramaddr == ccif.daddr);

	ccif.ramstate = ACCESS;
	assert(ccif.dwait == 0);

	#(PERIOD)
	#(PERIOD)
	#(PERIOD)
	
	ccif.dREN = 0;
	ccif.dWEN = 1;
	ccif.ramstate = FREE;
	
	#(PERIOD)
	#(PERIOD)
		
        assert(ccif.ramWEN == 1);
        assert(ccif.dload == ccif.ramload);
        assert(ccif.ramaddr == ccif.daddr);
	assert(ccif.ramstore == ccif.dstore);

	ccif.ramstate = ACCESS;
	assert(ccif.dwait == 0);
	
	#(PERIOD)
	#(PERIOD)
	#(PERIOD)

	ccif.dWEN = 0;
	ccif.iREN = 1;
	ccif.ramstate = FREE;
	
	#(PERIOD)
	#(PERIOD)
		
        assert(ccif.ramREN == 1);
        assert(ccif.iload == ccif.ramload);
        assert(ccif.ramaddr == ccif.iaddr);

	ccif.ramstate = ACCESS;
	assert(ccif.iwait == 0);
	
	#(PERIOD)
	#(PERIOD)
	
	$display("FINISHED");
	
	$finish;
     end
endprogram
