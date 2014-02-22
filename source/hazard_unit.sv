`include "cpu_types_pkg.vh"

module hazard_unit (
    input logic         dmemREN,
    input logic         dmemWEN,
    input logic         dhit,
    input logic         ihit,
    input logic         halt,
    input logic         branch_flag,
    input logic         zero_flag,
    input logic [31:0]  imemload,
    input logic         id_ex_dmemren,
    input logic [4:0]   id_ex_rt,
    input logic [4:0]   if_id_rs,
    input logic [4:0]   if_id_rt,
	output logic        pc_stall ,
	output logic        if_id_stall,
    output logic        if_id_bubble,
    output logic        if_id_flush,
	output logic        id_ex_stall,
    output logic        id_ex_flush,
    output logic        id_ex_bubble
);

logic stall;
logic flush;
logic use_after_load;
logic branch_flush;
logic jump_flush;

assign stall = (dmemREN || dmemWEN) && ~dhit;

assign branch_flush = (imemload[31:26] == 6'b000100 || imemload[31:26] == 6'b000101) //if BEQ || BNE
                ? ~(branch_flag ^ zero_flag) : 0;
assign jump_flush = (imemload[31:26] == 6'b000010 || imemload[31:26] == 6'b000011
                    || (imemload[31:26] == 6'b000000 && imemload[5:0] == 6'b001000)) ? 1 : 0;

assign flush = branch_flush || jump_flush;
assign use_after_load = id_ex_dmemren && ((id_ex_rt == if_id_rt) || (id_ex_rt == if_id_rs));

assign pc_stall = (ihit && ~halt && ~stall) || use_after_load;

assign if_id_stall = stall || use_after_load;
assign id_ex_stall = stall || use_after_load;

assign if_id_bubble = ~ihit;
assign id_ex_bubble = use_after_load;

assign if_id_flush = flush;
assign id_ex_flush = flush;

endmodule