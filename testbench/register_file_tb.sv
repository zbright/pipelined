/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// mapped needs this
`include "register_file_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module register_file_tb;

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
  register_file_if rfif ();
  // test program
  test PROG ();
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


 initial begin

	nRST = 1; 
 	#10
  	nRST = 0;
	#10
	nRST = 1;
	rfif.WEN = 0;
	#10
	rfif.WEN = 1;
	#5

	//enabling the write enable
	for (k=0; k<=31;k=k+1) begin
		#10
		rfif.wdat = k + 1;
		rfif.wsel = k;
		rfif.rsel2 = k;
		rfif.rsel1 = k;
		//tests every single write function to the register and shows that the 0 register is still the same
	end

	#10
	nRST = 0;
	#10
	nRST = 1;
	rfif.WEN = 0;
		
	for (k=0; k<=31;k=k+1) begin
		#10
		rfif.wdat = k + 1;
		rfif.wsel = k;
		rfif.rsel2 = k;
		rfif.rsel1 = k;
		//tests every single write function to the register and shows that all registers are 0
	end

 end

endmodule

<<<<<<< HEAD

=======
>>>>>>> aa81c8bad88fc3c4584bef66e53c9444c32a8d72
program test;
endprogram
