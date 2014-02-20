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
	output logic        pc_stall ,
	output logic        if_id_stall,
    output logic        if_id_bubble,
    output logic        if_id_flush,
	output logic        id_ex_stall,
    output logic        id_ex_flush
);

logic stall;
logic flush;

assign stall = (dmemREN || dmemWEN) && ~dhit;
assign flush = (imemload[31:26] == 6'b000100 || imemload[31:26] == 6'b000101) //if BEQ || BNE
                ? ~(branch_flag ^ zero_flag) : 0;


assign pc_stall = ihit && ~halt && ~stall;
assign if_id_stall = stall;
assign if_id_bubble = ~ihit;
assign id_ex_stall = stall;

assign if_id_flush = flush;
assign id_ex_flush = flush;

endmodule