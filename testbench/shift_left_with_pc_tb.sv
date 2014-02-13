// mapped needs this
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module shift_left_with_pc_tb;
   import cpu_types_pkg::*;
   
   parameter PERIOD = 10;

   word_t pc_next;
   logic [25:0] instr_in;
   word_t instr_out;

  // test program
  test PROG(pc_next, instr_in, instr_out);
  // DUT
`ifndef MAPPED
  shift_left_with_pc DUT(pc_next, instr_in, instr_out);
`else
  shift_left_with_pc DUT(
    .\pc_next (pc_next),
    .\instr_in (instr_in),
    .\instr_out (instr_out)
  );
`endif

endmodule

program test(
	     output cpu_types_pkg::word_t pc_next,
	     output logic [25:0] instr_in,
	     input cpu_types_pkg::word_t instr_out
	     );
   import cpu_types_pkg::*;
   parameter PERIOD = 20;

   initial
     begin
	pc_next = 32'hF0000000;
	instr_in = 26'b00000000000000000000000011;

	#(PERIOD)

	assert(instr_out === 32'b11110000000000000000000000001100)$display ("OK");
	else $display("%d", instr_out);
   
     end
   
   
endprogram
