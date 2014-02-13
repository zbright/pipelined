/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// mapped needs this
`include "register_file_if.vh"
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module register_file_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // test vars
  int v1 = 1;
  int v2 = 4721;
  int v3 = 25119;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  register_file_if rfif ();
  // test program
  test #(.PERIOD (PERIOD)) PROG(
				.CLK,
				.nRST
);
  // DUT
`ifndef MAPPED
  register_file DUT(CLK, nRST, rfif);
`else
  register_file DUT(
    .\rfif.rdat2 (rfif.rdat2),
    .\rfif.rdat1 (rfif.rdat1),
    .\rfif.wdat (rfif.wdat),
    .\rfif.rsel2 (rfif.rsel2),
    .\rfif.rsel1 (rfif.rsel1),
    .\rfif.wsel (rfif.wsel),
    .\rfif.WEN (rfif.WEN),
    .\nRST (nRST),
    .\CLK (CLK)
  );
`endif

endmodule

program test (
	      input logic CLK,
	      output logic nRST
);
   parameter PERIOD = 10;
   // test vars
   int v1 = 1;
   int v2 = 4721;
   int v3 = 25119;
   initial begin
     $monitor("@%00g CLK = %b nRST = %b",
     $time, CLK, nRST);
      nRST = 0;
      #(PERIOD)
      nRST = 1;
      rfif.WEN = 1;
      #(PERIOD)
      rfif.wsel = 0;
      rfif.wdat = v1;
      #(PERIOD)
      rfif.wsel = 1;
      rfif.wdat = v2; 
      #(PERIOD)
      rfif.wsel = 31;
      rfif.wdat = v3; 
      #(PERIOD)
      rfif.rsel1 = 1;
      rfif.rsel2 = 31;
      #(PERIOD)
      nRST = 0;
      #(PERIOD)
      $finish;
   end
endprogram
