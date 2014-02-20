`include "cpu_types_pkg.vh"

module hazard_unit (
    input logic         dmemREN,
    input logic         dmemWEN,
    input logic         dhit,
    input logic         ihit,
    input logic         halt,
	output logic        pc_stall ,
	output logic        if_id_stall,
    output logic        if_id_bubble,
	output logic        id_ex_stall
);

logic stall;

assign stall = (dmemREN || dmemWEN) && ~dhit;
assign pc_stall = ihit && ~halt && ~stall;
assign if_id_stall = stall;
assign if_id_bubble = ~ihit;
assign id_ex_stall = stall;


endmodule