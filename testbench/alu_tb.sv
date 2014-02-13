// mapped needs this
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module alu_tb;
   import cpu_types_pkg::*;
   
  parameter PERIOD = 10;
   logic [3:0] aluOP;
   logic neg_flag, overflow_flag, zero_flag;
   word_t pA, pB, out;
   
  // test program
  test #(.PERIOD (PERIOD)) PROG(
				.pA,
				.pB,
				.aluOP
);
  // DUT
  alu DUT(
    .\pA (pA),
    .\pB (pB),
    .\aluOP (aluOP),
    .\neg_flag (neg_flag),
    .\out (out),
    .\overflow_flag (overflow_flag),
    .\zero_flag (zero_flag)
  );

endmodule

program test (
 output logic [3:0]  aluOP,
 output cpu_types_pkg::word_t pA, pB
);
   parameter PERIOD = 10;
   initial begin
      //SLL
      pA = 1;
      pB = 1;
      aluOP = 4'b0000;
      
      #(PERIOD)
      //SRL
      pA = 2;
      pB = 1;
      aluOP = 4'b0001;
      
      #(PERIOD)
      //ADD
      pA = 20;
      pB = 10;
      aluOP = 4'b0010;
      #(PERIOD)
      pA = 32'h7FFFFFFF;
      pB = 32'h7FFFFFFF;
      aluOP = 4'b0010;
      #(PERIOD)
      pA = 32'h80000000;
      pB = 32'h80000000;
      aluOP = 4'b0010;
      
      #(PERIOD)
      //SUB
      pA = 20;
      pB = 10;
      aluOP = 4'b0011;
      #(PERIOD)
      pA = 0;
      pB = 10;
      aluOP = 4'b0011;
      
      #(PERIOD)
      //AND
      pA = 2;
      pB = 1;
      aluOP = 4'b0100;
      
      #(PERIOD)
      //OR
      pA = 2;
      pB = 1;
      aluOP = 4'b0101;
      
      #(PERIOD)
      //XOR
      pA = 2;
      pB = 1;
      aluOP = 4'b0110;
      
      #(PERIOD)
      //NOR
      pA = 2;
      pB = 1;
      aluOP = 4'b0111;
      
      #(PERIOD)
      //SLT
      pA = 2;
      pB = 1;
      aluOP = 4'b1000;
      #(PERIOD)
      pA = 1;
      pB = 2;
      aluOP = 4'b1000;
      #(PERIOD)
      pA = -2;
      pB = -1;
      aluOP = 4'b1000;
      #(PERIOD)
      pA = -1;
      pB = -2;
      aluOP = 4'b1000;
      
      #(PERIOD)
      //USLT
      pA = 2;
      pB = 1;
      aluOP = 4'b1001;
      #(PERIOD)
      pA = 1;
      pB = 2;
      aluOP = 4'b1001;
      #(PERIOD)
      pA = -2;
      pB = -1;
      aluOP = 4'b1001;
      #(PERIOD)
      $finish;
   end
endprogram
