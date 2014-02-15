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

  //ask Eric

  parameter CPUS = 2;

  //assign ccif.dREN [1] = 0;
  //assign ccif.dWEN [1] = 0;
  //assign ccif.iREN [1] = 0;
  //assign ccif.iwait [1] = 0;
  //assign ccif.dwait [1] = 0;

  always_comb
	begin		
		//initialize
		ccif.iwait = 1;
		ccif.dwait = 1;
		ccif.iload = ccif.ramload;
		ccif.dload = ccif.ramload;
		ccif.ramstore = 0;
		ccif.ramaddr = 0;
		ccif.ramWEN = 0;
		ccif.ramREN = 0;
		
		//defaulting everything
		//if ram is in access then the data is correct
		//if data read signal is sent
		if (ccif.dREN == 1) begin
			ccif.ramREN = 1;
			ccif.ramWEN = 0;
			ccif.ramaddr = ccif.daddr;
			ccif.iwait = 1;
			ccif.dwait = 1;			
			if (ccif.ramstate == ACCESS) begin
				ccif.dwait = 0;
			end
		//if data write signal is set
		end else if (ccif.dWEN == 1) begin
			ccif.ramREN = 0;
			ccif.ramWEN = 1;
			ccif.iwait = 1;
			ccif.dwait = 1;
			ccif.ramaddr = ccif.daddr;
			ccif.ramstore = ccif.dstore;
			if (ccif.ramstate == ACCESS) begin
				ccif.dwait = 0;
			end
		end else if (ccif.iREN == 1) begin
			ccif.ramREN = 1;
			ccif.ramWEN = 0;
			ccif.iwait = 1;
			ccif.dwait = 1;
			ccif.ramaddr = ccif.iaddr;
			if (ccif.ramstate == ACCESS) begin
				ccif.iwait = 0;
			end
		end

	end

endmodule
