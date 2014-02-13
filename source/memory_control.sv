/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "cache_control_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module memory_control (
  input CLK, nRST,
  cache_control_if.cc ccif
);
  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc
  parameter CPUS = 2;

   always_comb
     begin
	ccif.iwait = 1;
	ccif.dwait = 1;
	ccif.iload = 0;
	ccif.dload = 0;
	ccif.ramstore = 0;
	ccif.ramaddr = 0;
	ccif.ramWEN = 0;
	ccif.ramREN = 0;
	
	if(ccif.dREN == 1)
	  begin
	     ccif.ramREN = 1;
	     ccif.dload = ccif.ramload;
	     ccif.ramaddr = ccif.daddr;

	     if(ccif.ramstate == ACCESS)
	       begin
		  ccif.dwait = 0;
	       end
	  end
	else if(ccif.dWEN == 1)
	  begin
	     ccif.ramWEN = 1;
	     ccif.ramstore = ccif.dstore;
	     ccif.ramaddr = ccif.daddr;
	     ccif.dload = ccif.ramload;
	     
	     if(ccif.ramstate == ACCESS)
	       begin
		  ccif.dwait = 0;
	       end
	  end
	else if(ccif.iREN == 1)
	  begin
	     ccif.ramREN = 1;
	     ccif.ramaddr = ccif.iaddr;
	     ccif.iload = ccif.ramload;
	     
	     if(ccif.ramstate == ACCESS)
	       begin
		  ccif.iwait = 0;
	       end
	  end
     end

endmodule
