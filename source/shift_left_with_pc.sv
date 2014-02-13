`include "cpu_types_pkg.vh"

module shift_left_with_pc
(
 input cpu_types_pkg::word_t pc_next,
 input logic [25:0] instr_in,
 output cpu_types_pkg::word_t instr_out
);

   assign instr_out = {pc_next[31:26], instr_in << 2};

endmodule
   
