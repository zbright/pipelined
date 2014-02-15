// data path interface
`include "datapath_cache_if.vh"

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module request_unit_tb;

	logic request_dmemREN;
	logic request_dmemWEN;	

  // interface
  datapath_cache_if dpif ();
  // test program
  test PROG ();
  // DUT
`ifndef MAPPED
  request_unit DUT(
	request_dmemREN,
	request_dmemWEN,
	dpif);
`else
  request_unit DUT(
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
    .\request_dmemREN (request_dmemREN),
    .\request_dmemWEN (request_dmemWEN)
  );
`endif

	initial
		begin
			request_dmemREN = 1;
			request_dmemWEN = 1;
			#50
			dpif.dhit = 1;
			#50
			dpif.dhit = 0;
		end


endmodule



program test;
endprogram
