`include "cpu_types_pkg.vh"

module shift_left_2
(
 input cpu_types_pkg::word_t addr_in,
 output cpu_types_pkg::word_t addr_out
);

   assign addr_out = addr_in << 2;
   
endmodule
