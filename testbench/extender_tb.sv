// mapped needs this
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module extender_tb;
   import cpu_types_pkg::*;
   
   parameter PERIOD = 10;

   logic [15:0] immediate;
   logic [1:0] extend_code;
   word_t extended_imm;

  // test program
  test PROG(immediate, extend_code, extended_imm);
  // DUT
`ifndef MAPPED
  extender DUT(immediate, extend_code, extended_imm);
`else
  extender DUT(
    .\extended_immediate (extended_immediate),
    .\extend_code (extend_code),
    .\immediate (immediate)
  );
`endif

endmodule

program test (
	      output logic [15:0] immediate,
	      output logic [1:0] extend_code,
	      input cpu_types_pkg::word_t extended_imm
);
   import cpu_types_pkg::*;
   
   parameter PERIOD = 10;

   initial begin
      immediate = 16'b1111111111111111;

      //Zero extend
      extend_code = 2'b00;
      #(PERIOD)
      assert(extended_imm === 32'b00000000000000001111111111111111)$display ("OK");
      else $display("%d", extended_imm);
      

      #(PERIOD)
      
      //Sign extend - 1
      extend_code = 2'b01;
      #(PERIOD)
      assert(extended_imm === 32'b11111111111111111111111111111111)$display ("OK");
      else $display("%d", extended_imm);

      #(PERIOD)
      
      //Sign extend - 0
      immediate = 16'b0111111111111111;
      extend_code = 2'b01;
      #(PERIOD)
      assert(extended_imm === 32'b00000000000000000111111111111111)$display ("OK");
      else $display("%d", extended_imm);
            
      #(PERIOD)
      
      //No op code sent
      extend_code = 2'b11;
      #(PERIOD)
      assert(extended_imm === 32'hXXXXXXXX)$display ("OK");
      else $display("%d", extended_imm);

      #(PERIOD)
      
      extend_code = 2'b10;
      #(PERIOD)
      assert(extended_imm === 32'hXXXXXXXX)$display ("OK");
      else $display("%d", extended_imm);
      
      $finish;
   end
endprogram
