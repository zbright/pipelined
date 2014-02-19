`include "cpu_types_pkg.vh"

module harzard_unit (
	input logic [4:0]   branch_dest,
	input logic [31:0]  imemload,
    input logic         mem_read,
	output logic        pc_stall ,
	output logic [1:0]  if_id_out,
	output logic [1:0]  id_ex_out,
	output logic [1:0]  ex_mem_out
);

always_comb
    begin
    end


endmodule