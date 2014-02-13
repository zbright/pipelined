`include "cpu_types_pkg.vh"

module shift_left_16
(
 input logic[15:0] imm_in,
 output cpu_types_pkg::word_t addr_out
);

   assign addr_out = imm_in << 16;
   
endmodule
