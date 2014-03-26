`include "datapath_cache_if.vh"

//register interface
`include "cache_control_if.vh"

// types
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module icache_tb;
  // clock period
  parameter PERIOD = 20;

  // signals
  logic CLK = 1, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  datapath_cache_if dcif();

  cache_control_if ccif();

  // test program
  test                                PROG (CLK,nRST,dcif,ccif);

  // dut
`ifndef MAPPED
  icache                              DUT (CLK,nRST,dcif,ccif);
`else
  icache                              DUT (,,,,//for altera debug ports
    CLK,
    nRST,
    dcif.imemREN,
    dcif.imemaddr,
    dcif.ihit,
    dcif.imemload,
    ccif.iwait,
    ccif.iload,
    ccif.iREN,
    ccif.iaddr
  );
`endif
endmodule

program test(input logic CLK, output logic nRST, datapath_cache_if.icache dcif, cache_control_if.icache ccif);
  // import word type
  import cpu_types_pkg::word_t;

  // number of cycles
  int unsigned cycles = 0;

  initial
  begin
  end

endprogram
