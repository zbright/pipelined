/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// mapped needs this
`include "alu_if.vh"
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module alu_tb;

  parameter PERIOD = 10;

  // interface
  alu_if aluif ();
  // test program
  test PROG (
    .aluif);
  // DUT
`ifndef MAPPED
  alu DUT(aluif);
`else
  alu DUT(
    .\aluif.negative (aluif.negative),
    .\aluif.overflow (aluif.overflow),
    .\aluif.zero (aluif.zero),
    .\aluif.aluOp (aluif.aluOp),
    .\aluif.portA (aluif.portA),
    .\aluif.portB (aluif.portB),
    .\aluif.portOut (aluif.portOut)
  );
`endif

endmodule

program test (
  alu_if.tb aluif
);
  import cpu_types_pkg::*;
  // test vars
  int v1 = 1;
  int v2 = 4721;
  int v3 = 25119;
  parameter PERIOD = 10;
  initial begin
    $monitor("@%00g aluOp=%s portA=%h portB=%h out=%h  Z=%b V=%b N=%b  aluif=%p",
    $time, aluif.aluOp.name(), aluif.portA, aluif.portB, aluif.portOut, aluif.zero, aluif.overflow, aluif.negative, aluif);

    aluif.aluOp = ALU_SLL;
    aluif.portA = 1'b1;
    aluif.portB = 1'b1;    
    #(PERIOD)
    aluif.portA = 32'hC0000001;
    aluif.portB = 32'h00000001;
    #(PERIOD)
    aluif.portA = 32'h00000001;
    aluif.portB = 32'h000F0000;
    #(PERIOD)
    aluif.portA = 32'h00000001;
    aluif.portB = 32'h00000001;
    #(PERIOD)
    aluif.aluOp = ALU_SRL;
    aluif.portA = 32'h00000001;
    aluif.portB = 32'h00000001;
    #(PERIOD)
    aluif.portA = 32'hF0000001;
    aluif.portB = 32'h00000020;
    #(PERIOD)
    aluif.portA = 32'h80000001;
    aluif.portB = 32'h00000010;
    #(PERIOD)
    aluif.portA = 32'hF0000001;
    aluif.portB = 32'h0000000F;
    #(PERIOD)
    aluif.portA = 32'hF0000001;
    aluif.portB = 32'h0000001F;
    #(PERIOD)
    aluif.aluOp = ALU_ADD;
    aluif.portA = 32'h00000001;
    aluif.portB = 32'h00000001;
    #(PERIOD)
    aluif.portA = 32'hFFFFFFF0;
    aluif.portB = 32'h00000001;
    #(PERIOD)
    aluif.portA = 32'hFFFFFFFF;
    aluif.portB = 32'h00000001;
    #(PERIOD)
    aluif.portA = 32'hFFFFFFFF;
    aluif.portB = 32'hFFFFFFFF;
    #(PERIOD)    
    aluif.portA = 32'h7FFFFFFF;
    aluif.portB = 32'h7FFFFFFF;
    #(PERIOD)
    aluif.portA = 32'h7FFFFFFF;
    aluif.portB = 32'h00000001;
    #(PERIOD)
    aluif.aluOp = ALU_SUB;
    aluif.portA = 32'h80000000;
    aluif.portB = 32'h00000001;
    #(PERIOD)
    aluif.portA = 32'h0000FFFF;
    aluif.portB = 32'hFFFF0000;
    #(PERIOD)
    aluif.portA = 32'hFFFF0000;
    aluif.portB = 32'h00000001;
    #(PERIOD)
    aluif.portA = 32'h00000001;
    aluif.portB = 32'h7FFFFFFF;
    #(PERIOD)
    aluif.portA = 32'h000000FF;
    aluif.portB = 32'h00000FFF;

    #(PERIOD)
    aluif.aluOp = ALU_AND;
    aluif.portA = 32'h00000001;
    aluif.portB = 32'h00000001;
    #(PERIOD)
    aluif.portA = 32'h00000101;
    aluif.portB = 32'h00001010;
    #(PERIOD)
    aluif.portA = 32'h8000FF01;
    aluif.portB = 32'h800FF001;
    #(PERIOD)
    aluif.aluOp = ALU_OR;
    aluif.portA = 32'h00000001;
    aluif.portB = 32'h00000001;
    #(PERIOD)
    aluif.portA = 32'h000F0001;
    aluif.portB = 32'h000B0010;
    #(PERIOD)
    aluif.aluOp = ALU_XOR;
    aluif.portA = 32'h00000001;
    aluif.portB = 32'h00000001;
    #(PERIOD)
    aluif.portA = 32'h55555555;
    aluif.portB = 32'hCCCCCCCC;
    #(PERIOD)
    aluif.aluOp = ALU_NOR;
    aluif.portA = 32'h00000001;
    aluif.portB = 32'h00000001;
    #(PERIOD)
    aluif.portA = 32'hFFFFFFFF;
    aluif.portB = 32'hFFFFFFFF;
    #(PERIOD)
    aluif.aluOp = ALU_SLT;
    aluif.portA = 32'h80000000;
    aluif.portB = 32'h80000001;
    #(PERIOD) aluif.aluOp = ALU_SLTU;
    #(PERIOD)
    aluif.portA = 32'h00000001;
    aluif.portB = 32'h00000001;
    #(PERIOD)
    aluif.aluOp = ALU_SLT;
    aluif.portA = 32'hFFFFFFFE;
    aluif.portB = 32'h7FFFFFFF;
    #(PERIOD) aluif.aluOp = ALU_SLTU;
    #(PERIOD) aluif.aluOp = ALU_SLT;
    aluif.portA = 32'hFFFFFFFD;
    aluif.portB = 32'h7FFFFFFF;
    #(PERIOD) aluif.aluOp = ALU_SLTU;
    #(PERIOD) aluif.aluOp = ALU_SLT;
    aluif.portA = 32'hFFFFFFFD;
    aluif.portB = 32'h7FFFFFFE;


    #(PERIOD) aluif.aluOp = ALU_SLTU;

    #(PERIOD)
    $finish;
  end
endprogram
